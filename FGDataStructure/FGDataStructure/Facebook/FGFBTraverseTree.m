//
//  FGFBTraverseTree.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 6/12/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGFBTraverseTree.h"

@implementation FGFBTreeNode

- (instancetype)initWithValue:(id)value
{
    if (self = [super init]) {
        _value = value;
    }
    return self;
}

@end

@interface FGFBTraverseTree()

@property (nonatomic, strong) tree_node_visit_block_t visit;

@end

@implementation FGFBTraverseTree

- (instancetype)initWithVisitBlock:(tree_node_visit_block_t)block
{
    if (self = [super init]) {
        _visit = block;
    }
    return self;
}

- (void)preOrderTraverseTree:(FGFBTreeNode *)root
{
    self.visit(root);
    if (root.left) {
        [self preOrderTraverseTree:root.left];
    }
    if (root.right) {
        [self preOrderTraverseTree:root.right];
    }
}

- (void)inOrderTraverseTree:(FGFBTreeNode *)root
{
    if (root.left) {
        [self inOrderTraverseTree:root.left];
    }
    self.visit(root);
    if (root.right) {
        [self inOrderTraverseTree:root.right];
    }
}

- (void)postOrderTraverseTree:(FGFBTreeNode *)root
{
    if (root.left) {
        [self postOrderTraverseTree:root.left];
    }
    if (root.right) {
        [self postOrderTraverseTree:root.right];
    }
    self.visit(root);
}

@end
