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

/**
 *  The height of a binary tree is the number of edges between the tree's root and its furthest leaf. This means that a tree containing a single node has a height of 0
 0
 .
 
 Complete the height function provided in your editor so that it returns the height of a binary tree. This function has a parameter, root
 r
 o
 o
 t
 , which is a pointer to the root node of a binary tree.
 
 Input Format
 
 You do not need to read any input from stdin. Our grader will pass the root node of a binary tree to your height function.
 
 Output Format
 
 Your function should return a single integer denoting the height of the binary tree.
 */
- (int)height;

/**
 *  You are given a pointer to the root of a binary tree. Print the top view of the binary tree.
 You only have to complete the function.
 For example :
 
 3
 /   \
 5     2
 / \   / \
 1   4 6   7
 \       /
 9     8
 Top View : 1 -> 5 -> 3 -> 2 -> 7
 Input Format
 
 You are given a function,
 
 void top_view(node * root)
 {
 
 }
 Output Format
 
 Print the values on a single line separated by space.
 
 Sample Input
 
 3
 /   \
 5     2
 / \   / \
 1   4 6   7
 \       /
 9     8
 Sample Output
 
 1 5 3 2 7
 */
- (NSString *)printTopView;

/**
 *  You are given a pointer to the root of a binary tree. You need to print the level order traversal of this tree. In level order traversal, we visit the nodes level by level from left to right.
 You only have to complete the function.
 For example:
 
 3
 /   \
 5     2
 / \    /
 1   4  6
 For the above tree, the level order traversal is 3 -> 5 -> 2 -> 1 -> 4 -> 6.
 
 Input Format
 
 You are given a function,
 
 void level_order(node * root)
 {
 
 }
 Output Format
 
 Print the values in a single line seperated by a space.
 
 Sample Input
 
 3
 /   \
 5     2
 / \    /
 1   4  6
 Sample Output
 
 3 5 2 1 4 6
 Explanation
 
 Level 1:        3
 /   \
 Level 2:     5     2
 / \    /
 Level 3:   1   4  6
 We need to print the nodes level by level. We process each level from left to right.
 Level Order Traversal: 3 -> 5 -> 2 -> 1 -> 4 -> 6
 */
- (NSString *)printLevelOrder;

@end

@interface FGHRTreeNode : NSObject<NSCopying>

@property (nonatomic, strong) FGHRTreeNode *left;
@property (nonatomic, strong) FGHRTreeNode *right;
@property (nonatomic, assign) int data;

- (instancetype)initWitData:(int)data left:(FGHRTreeNode *)left right:(FGHRTreeNode *)right;

@end
