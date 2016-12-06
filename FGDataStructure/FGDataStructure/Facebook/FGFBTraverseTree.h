//
//  FGFBTraverseTree.h
//  FGDataStructure
//
//  Created by Stephen Zhang on 6/12/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FGFBTreeNode<__covariant ObjectType>:NSObject

@property (nonatomic, strong, readonly) ObjectType value;
@property (nonatomic, strong, nullable) FGFBTreeNode *left;
@property (nonatomic, strong, nullable) FGFBTreeNode *right;

- (instancetype)initWithValue:(id)value NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;

@end

typedef void(^tree_node_visit_block_t)(FGFBTreeNode *treeNode);

@interface FGFBTraverseTree : NSObject

- (void)preOrderTraverseTree:(FGFBTreeNode *)root;
- (void)inOrderTraverseTree:(FGFBTreeNode *)root;
- (void)postOrderTraverseTree:(FGFBTreeNode *)root;

- (instancetype)initWithVisitBlock:(tree_node_visit_block_t)block NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
