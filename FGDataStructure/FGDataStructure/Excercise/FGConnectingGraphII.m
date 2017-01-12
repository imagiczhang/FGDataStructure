//
//  FGConnectingGraphII.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 12/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import "FGConnectingGraphII.h"

@interface FGConnectingGraphII ()

@property (nonatomic, strong) NSMutableArray<NSNumber *> *parent;
@property (nonatomic, strong) NSMutableArray<NSNumber *> *countOfNodes;

@end

@implementation FGConnectingGraphII

- (instancetype)initWithN:(NSInteger)n
{
    if (self = [super init]) {
        _parent = [NSMutableArray array];
        _countOfNodes = [NSMutableArray array];
        
        for (int i = 0; i < n; i++) {
            [_parent addObject:@(i)];
            [_countOfNodes addObject:@1];
        }
    }
    return self;
}

- (void)connect:(NSInteger)a with:(NSInteger)b
{
    NSInteger rootA = [self findRoot:a-1];
    NSInteger rootB = [self findRoot:b-1];
    if (rootA != rootB) {
        self.parent[rootB] = @(rootA);
        self.countOfNodes[rootA] = @(self.countOfNodes[rootA].integerValue + self.countOfNodes[rootB].integerValue);
    }
}

- (NSInteger)findRoot:(NSInteger)node
{
    NSInteger parent = self.parent[node].integerValue;
    if (parent == node) {
        return node;
    }
    
    NSInteger root = [self findRoot:parent];
    if (root != parent) {
        self.parent[node] = @(root);
    }
    return root;
}

- (NSInteger)query:(NSInteger)node
{
    NSInteger root = [self findRoot:node-1];
    return self.countOfNodes[root].integerValue;
}

@end
