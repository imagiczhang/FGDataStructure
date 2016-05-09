//
//  FGHRTree.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 10/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGHRTree.h"

@interface FGHRTree ()

@property (nonatomic, strong) FGHRTreeNode *node;
@property (nonatomic, strong) NSMutableArray *elements;
@end

@implementation FGHRTree

- (instancetype)initWithTreeNode:(FGHRTreeNode *)node {
    if (self = [super init]) {
        _node = node;
    }
    
    return self;
}

- (NSString *)printPreOrder {
    self.elements = [NSMutableArray array];
    [self preOrder:self.node];
    return [self print];
}

- (NSString *)printPostOrder {
    self.elements = [NSMutableArray array];
    [self postOrder:self.node];
    return [self print];
}

- (NSString *)printInOrder {
    self.elements = [NSMutableArray array];
    [self inOrder:self.node];
    return [self print];
}
#pragma mark - Privarte
- (NSString *)print {
    return [self.elements componentsJoinedByString:@" "];
}


- (void)preOrder:(FGHRTreeNode *)node {
    FGHRTreeNode *currentNode = node;
    
    [self.elements addObject:@(currentNode.data)];
    if (currentNode.left) {
        [self preOrder:currentNode.left];
    }
    
    if (currentNode.right) {
        [self preOrder:currentNode.right];
    }
}

- (void)postOrder:(FGHRTreeNode *)node {
    FGHRTreeNode *currentNode = node;
    
    if (currentNode.left) {
        [self postOrder:currentNode.left];
    }
    
    if (currentNode.right) {
        [self postOrder:currentNode.right];
    }
    
    [self.elements addObject:@(currentNode.data)];
}

- (void)inOrder:(FGHRTreeNode *)node {
    FGHRTreeNode *currentNode = node;
    
    if (currentNode.left) {
        [self inOrder:currentNode.left];
    }
    
    [self.elements addObject:@(currentNode.data)];
    
    if (currentNode.right) {
        [self inOrder:currentNode.right];
    }
}

@end

@implementation FGHRTreeNode

- (instancetype)initWitData:(int)data left:(FGHRTreeNode *)left right:(FGHRTreeNode *)right {
    if (self = [super init]) {
        _data = data;
        _left = left;
        _right = right;
    }
    
    return self;
}

@end
