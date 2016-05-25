//
//  FGTree.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 23/04/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FGBSTreeObject.h"
#import "FGBSTreeType.h"

@class FGBSTreeNode;
@interface FGBSTree : NSObject

@property (nonatomic, strong) FGBSTreeNode *root;

- (instancetype)initWithCompareSelector:(SEL)selector;
- (void)addObject:(FGBSTreeObject *)object;
- (void)enumerateTreeByUsingBlock:(void (^)(FGBSTreeObject *object))block withOrderType:(FGTreeOrderType)type;

@end
