//
//  FGHRBalancedTree.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 12/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FGHRBalancedTreeNode;
@interface FGHRBalancedTree : NSObject

- (instancetype)initWithTreeNode:(FGHRBalancedTreeNode *)node;

@end

@interface FGHRBalancedTreeNode : NSObject<NSCopying>

@property (nonatomic, strong) FGHRBalancedTreeNode *left;
@property (nonatomic, strong) FGHRBalancedTreeNode *right;
@property (nonatomic, assign) int data;
@property (nonatomic, assign) int height;

- (instancetype)initWitData:(int)data height:(int)height left:(FGHRBalancedTreeNode *)left right:(FGHRBalancedTreeNode *)right;

@end