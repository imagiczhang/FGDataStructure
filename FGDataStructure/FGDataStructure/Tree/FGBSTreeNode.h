//
//  FGTreeNode.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 23/04/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FGBSTreeNode : NSObject

@property (nonatomic, strong) FGBSTreeNode *left;
@property (nonatomic, strong) FGBSTreeNode *right;
@property (nonatomic, weak) FGBSTreeNode *parent;
@property (nonatomic, strong) NSObject *data;

- (instancetype)initWithData:(NSObject *)data;

@end
