//
//  FGConnectingGraph.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 12/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import "FGConnectingGraph.h"

@interface FGConnectingGraph ()

@property (nonatomic, strong) NSMutableArray<NSNumber *> *parent;

@end

@implementation FGConnectingGraph

- (instancetype)initWithN:(NSInteger)n
{
    if (self = [super init]) {
        _parent = [NSMutableArray array];
        for (int i = 0; i < n; i++) {
            _parent[i] = @(i);
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
    }
}

- (BOOL)query:(NSInteger)a with:(NSInteger)b
{
    NSInteger rootA = [self findRoot:a-1];
    NSInteger rootB = [self findRoot:b-1];
    return rootA == rootB;
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

@end
