//
//  FGHashTable.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 26/04/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGHashTable.h"

@interface FGHashTable ()

@property (nonatomic, assign) NSUInteger size;
@property (nonatomic, strong) NSMutableArray *hashTable;

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
    if (_hashTable.count == 0) return nil;
    
    return [_hashTable objectAtIndex:[self indexForKey:key]];
}

- (void)setObject:(NSObject *)object forKey:(NSString *)key
{
    [_hashTable insertObject:object atIndex:[self indexForKey:key]];
}

- (void)removeObjectForKey:(NSString *)key
{
    [_hashTable removeObjectAtIndex:[self indexForKey:key]];
}

#pragma mark - Internal methods

- (NSInteger)indexForKey:(NSString *)key
{
    NSUInteger hash = key.hash;
    return hash % self.size;
}

- (void)initHashTable
{
    for (NSInteger count = 0; count < self.size; count ++) {
        [_hashTable addObject:[NSNull null]];
    }
}

@end
