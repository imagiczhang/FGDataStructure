//
//  FGHashTable.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 26/04/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGHashTable.h"
#import "FGHashTableNode.h"

@interface FGHashTable ()

@property (nonatomic, assign) NSUInteger size;
@property (nonatomic, strong) NSMutableArray<NSMutableArray *> *hashTable;

@end

@implementation FGHashTable

- (instancetype)initWithSize:(NSUInteger)size
{
    if (self = [super init]) {
        _size = size;
        _hashTable = [[NSMutableArray alloc] initWithCapacity:size];
        [self initHashTable];
    }
    
    return self;
}

- (NSObject *)objectForKey:(NSString *)key
{
    NSUInteger index = [self indexForKey:key];
    NSMutableArray<FGHashTableNode *> *list = _hashTable[index];
    
    FGHashTableNode *node = [self findNodeWithList:list forKey:key];
    
    if (node) {
        return node.object;
    }
    
    return nil;
}

- (void)setObject:(NSObject *)object forKey:(NSString *)key
{
    NSUInteger index = [self indexForKey:key];
    NSMutableArray<FGHashTableNode *> *list = _hashTable[index];
    
    FGHashTableNode *node = [self findNodeWithList:list forKey:key];
    
    if (node) {
        [node setObject:object];
    } else {
        FGHashTableNode *newNode = [[FGHashTableNode alloc] initWithObject:object key:key];
        [list addObject:newNode];
    }
}

- (void)removeObjectForKey:(NSString *)key
{
    NSUInteger index = [self indexForKey:key];
    NSMutableArray<FGHashTableNode *> *list = _hashTable[index];
    
    FGHashTableNode *node = [self findNodeWithList:list forKey:key];
    if (node) {
        [list removeObject:node];
    }
}

#pragma mark - Internal methods

- (FGHashTableNode *)findNodeWithList:(NSMutableArray<FGHashTableNode *> *)list forKey:(NSString *)key
{
    for (NSInteger index = 0; list.count; index++) {
        FGHashTableNode *node = list[index];
        if ([node.key isEqualToString:key]) {
            return node;
        }
    }
    
    return nil;
}

- (NSInteger)indexForKey:(NSString *)key
{
    NSUInteger hash = key.hash;
    return hash % self.size;
}

- (void)initHashTable
{
    for (NSInteger count = 0; count < self.size; count ++) {
        [_hashTable addObject:[NSMutableArray array]];
    }
}

@end
