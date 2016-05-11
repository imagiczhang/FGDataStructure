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

- (int)height {
    return [self heightWithNode:self.node];
}

- (int)heightWithNode:(FGHRTreeNode *)node {
    if (!node) {
        return -1;
    }
    
    int leftHeight = [self heightWithNode:node.left];
    int rightHeight = [self heightWithNode:node.right];
    
    if (leftHeight > rightHeight) {
        return leftHeight + 1;
    } else {
        return rightHeight + 1;
    }
}

- (NSString *)printTopView {
    self.elements = [NSMutableArray array];
    NSMutableArray *leftArray = [NSMutableArray array];
    
    FGHRTreeNode *leftNode = self.node.left;
    FGHRTreeNode *rightNode = self.node.right;
    
    while (leftNode) {
        [leftArray addObject:@(leftNode.data)];
        leftNode = leftNode.left;
    }
    
    for (NSInteger i = leftArray.count - 1; i >=0; i--) {
        [self.elements addObject:leftArray[i]];
    }
    
    [self.elements addObject:@(self.node.data)];
    
    while (rightNode) {
        [self.elements addObject:@(rightNode.data)];
        rightNode = rightNode.right;
    }
    
    return [self print];
}

- (NSString *)printLevelOrder {
    self.elements = [NSMutableArray array];
    
    [self levelOrderFromArray:[@[self.node] mutableCopy]];
    
    return [self print];
}

- (void)levelOrderFromArray:(NSMutableArray<FGHRTreeNode *> *)array {
    NSMutableArray<FGHRTreeNode *> *next = [NSMutableArray array];
    for (FGHRTreeNode *node in array) {
        [self.elements addObject:@(node.data)];
        if (node.left) [next addObject:node.left];
        if (node.right) [next addObject:node.right];
    }
    
    if ([next count] > 0) [self levelOrderFromArray:next];
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

- (id)copyWithZone:(NSZone *)zone {
    FGHRTreeNode *nodeCopy = [[FGHRTreeNode allocWithZone:zone] init];
    
    nodeCopy.left = _left.copy;
    nodeCopy.right = _right.copy;
    nodeCopy.data = _data;
    
    return nodeCopy;
    
}

@end
