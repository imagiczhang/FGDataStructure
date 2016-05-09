//
//  FGHRTree.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 10/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FGHRTreeNode;
@interface FGHRTree : NSObject

- (instancetype)initWithTreeNode:(FGHRTreeNode *)node;

/**
 *  Complete the preOrder function in your editor below, which has 1
 1
 parameter: a pointer to the root of a binary tree. It must print the values in the tree's preorder traversal as a single line of space-separated values.
 
 Input Format
 
 Our hidden tester code passes the root node of a binary tree to your preOrder function.
 
 Output Format
 
 Print the tree's preorder traversal as a single line of space-separated values.
 */
- (NSString *)printPreOrder;

/**
 *  Complete the postOrder function in your editor below, which has 1
 1
 parameter: a pointer to the root of a binary tree. It must print the values in the tree's preorder traversal as a single line of space-separated values.
 
 Input Format
 
 Our hidden tester code passes the root node of a binary tree to your postOrder function.
 
 Output Format
 
 Print the tree's postorder traversal as a single line of space-separated values.
 */
- (NSString *)printPostOrder;

/**
 *  Complete the inOrder function in your editor below, which has 1
 1
 parameter: a pointer to the root of a binary tree. It must print the values in the tree's preorder traversal as a single line of space-separated values.
 
 Input Format
 
 Our hidden tester code passes the root node of a binary tree to your inOrder function.
 
 Output Format
 
 Print the tree's inorder traversal as a single line of space-separated values.
 */
- (NSString *)printInOrder;

@end

@interface FGHRTreeNode : NSObject

@property (nonatomic, strong) FGHRTreeNode *left;
@property (nonatomic, strong) FGHRTreeNode *right;
@property (nonatomic, assign) int data;

- (instancetype)initWitData:(int)data left:(FGHRTreeNode *)left right:(FGHRTreeNode *)right;

@end
