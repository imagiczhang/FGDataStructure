//
//  FGFBIslandsUnionFind.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 8/12/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGFBIslandsUnionFind.h"

@interface FGFBUnionFind ()

@property (nonatomic, strong) NSMutableDictionary<NSNumber *, NSNumber *> *nodeToRootMap;

@end

@implementation FGFBUnionFind

- (instancetype)init
{
    if (self = [super init]) {
        _nodeToRootMap = [NSMutableDictionary dictionary];
        _countOfUnions = 0;
    }
    return self;
}

- (void)addNode:(NSUInteger)nodeNumber;
{
    if (!self.nodeToRootMap[@(nodeNumber)]) {
        self.nodeToRootMap[@(nodeNumber)] = @(nodeNumber);
        self.countOfUnions++;
    }
}

- (void)connectNode:(NSUInteger)node1 withNode:(NSUInteger)node2
{
    if (self.nodeToRootMap[@(node1)] && self.nodeToRootMap[@(node2)]) {
        NSUInteger root1 = [self rootOfNode:node1];
        NSUInteger root2 = [self rootOfNode:node2];
        if (root1 != root2) {
            self.nodeToRootMap[@(root2)] = @(root1);
            self.countOfUnions--;
        }
    }
}

- (NSUInteger)rootOfNode:(NSUInteger)node
{
    NSAssert(self.nodeToRootMap[@(node)], @"node does not exists in union find");
    NSUInteger root = node;
    while (self.nodeToRootMap[@(root)] && ![self.nodeToRootMap[@(root)] isEqualToNumber:@(root)]) {
        root = [self.nodeToRootMap[@(root)] unsignedIntegerValue];
    }
    self.nodeToRootMap[@(node)] = @(root);
    return root;
}

@end

@implementation FGFBIslandsUnionFind

+ (NSUInteger)countOfIslandsInMap:(NSArray<NSArray<NSString *> *> *)map
{
    NSUInteger rows = [map count];
    NSAssert(rows > 0, @"There need to be at least one row.");
    NSUInteger columns = [[map firstObject] count];
    NSAssert(columns > 0, @"There need to be at least one column");
    
    FGFBUnionFind *unionFind = [[FGFBUnionFind alloc] init];
    
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < columns; j++) {
            if ([[map[i][j] lowercaseString] isEqualToString:@"x"]) {
                [unionFind addNode:i * columns + j];
                
                if (i > 0 && [[map[i-1][j] lowercaseString] isEqualToString:@"x"]) {
                    [unionFind connectNode:i * columns + j withNode:(i-1) * columns + j];
                }
                
                if (j > 0 && [[map[i][j-1] lowercaseString] isEqualToString:@"x"]) {
                    [unionFind connectNode:i * columns + j withNode:i * columns + j - 1];
                }
            }
        }
    }
    
    return unionFind.countOfUnions;
}

@end
