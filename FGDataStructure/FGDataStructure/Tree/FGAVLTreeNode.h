//
//  FGAVLTreeNode.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 31/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FGAVLTreeNode : NSObject

@property (nonatomic, assign) NSInteger height;
@property (nonatomic, strong) NSNumber *object;
@property (nonatomic, strong) FGAVLTreeNode *leftChild;
@property (nonatomic, strong) FGAVLTreeNode *rightChild;

- (void)printDescription;

@end
