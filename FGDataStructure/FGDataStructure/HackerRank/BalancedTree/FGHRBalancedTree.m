//
//  FGHRBalancedTree.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 12/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGHRBalancedTree.h"

@interface FGHRBalancedTree ()

@property (nonatomic, strong) FGHRBalancedTreeNode *node;
@property (nonatomic, strong) NSMutableArray *elements;

@end

@implementation FGHRBalancedTree

- (instancetype)initWithTreeNode:(FGHRBalancedTreeNode *)node {
    if (self = [super init]) {
        _node = node;
    }
    
    return self;
}

@end

@implementation FGHRBalancedTreeNode

- (instancetype)initWitData:(int)data height:(int)height left:(FGHRBalancedTreeNode *)left right:(FGHRBalancedTreeNode *)right {
    if (self = [super init]) {
        _data = data;
        _height = height;
        _left = left;
        _right = right;
    }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    FGHRBalancedTreeNode *nodeCopy = [[FGHRBalancedTreeNode allocWithZone:zone] init];
    
    nodeCopy.left = _left.copy;
    nodeCopy.right = _right.copy;
    nodeCopy.data = _data;
    nodeCopy.height = _height;
    
    return nodeCopy;
    
}

@end