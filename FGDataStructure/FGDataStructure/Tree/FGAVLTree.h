//
//  FGAVLTree.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 31/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FGAVLTreeNode;
@interface FGAVLTree : NSObject

@property (nonatomic, strong) FGAVLTreeNode *root;

- (instancetype)initWithObject:(NSNumber *)object;
- (void)insertObject:(NSNumber *)newObject;
- (void)printDescription;
- (FGAVLTreeNode *)find:(NSNumber *)object;
- (void)deleteObject:(NSNumber *)object;

@end
