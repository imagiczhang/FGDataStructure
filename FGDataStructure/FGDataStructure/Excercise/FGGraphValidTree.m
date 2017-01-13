//
//  FGGraphValidTree.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 13/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import "FGGraphValidTree.h"

@interface FGGraphValidTree ()

@property (nonatomic) BOOL hasCircle;
@property (nonatomic) NSInteger count;
@property (nonatomic, strong) NSMutableArray<NSNumber *> *parent;

@end

@implementation FGGraphValidTree

- (instancetype)initWithN:(NSInteger)n edges:(NSArray<NSArray<NSNumber *> *> *)edges
{
    if (self = [super init]) {
        _count = n;
        _hasCircle = NO;
        _parent = [NSMutableArray array];
        for (int i = 0; i < n; i++) {
            _parent[i] = @(i);
        }
        
        [self parseEdges:edges];
    }
    return self;
}

- (BOOL)isValidTree
{
    return !self.hasCircle && self.count == 1;
}

- (void)parseEdges:(NSArray<NSArray<NSNumber *> *> *)edges
{
    for (NSArray<NSNumber *> *edge in edges) {
        [self connect:edge[0].integerValue with:edge[1].integerValue];
    }
}

- (void)connect:(NSInteger)a with:(NSInteger)b
{
    NSInteger rootA = [self findRoot:a];
    NSInteger rootB = [self findRoot:b];
    
    if (rootA == rootB) {
        self.hasCircle = YES;
    } else {
        self.parent[rootB] = @(rootA);
        self.count--;
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

@end
