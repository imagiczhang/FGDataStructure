//
//  FGConnectingGraphIII.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 12/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import "FGConnectingGraphIII.h"

@interface FGConnectingGraphIII ()

@property (nonatomic, strong) NSMutableArray<NSNumber *> *parent;
@property (nonatomic) NSInteger count;

@end

@implementation FGConnectingGraphIII

- (instancetype)initWithN:(NSInteger)n {
    if (self = [super init]) {
        _parent = [NSMutableArray array];
        for (int i = 0; i < n; i++) {
            [_parent addObject:@(i)];
        }
        _count = n;
    }
    return self;
}

- (void)connect:(NSInteger)a with:(NSInteger)b
{
    NSInteger rootA = [self findRoot:a-1];
    NSInteger rootB = [self findRoot:b-1];
    if (rootA != rootB) {
        self.parent[rootB] = @(rootA);
        self.count--;
    }
}

- (NSInteger)query
{
    return self.count;
}

- (NSInteger)findRoot:(NSInteger)node
{
    NSInteger parentNode = self.parent[node].integerValue;
    if (parentNode == node) {
        return node;
    }
    
    NSInteger root = [self findRoot:parentNode];
    if (root != parentNode) {
        self.parent[node] = @(root);
    }
    return root;
}

@end
