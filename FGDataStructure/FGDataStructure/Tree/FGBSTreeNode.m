//
//  FGTreeNode.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 23/04/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGBSTreeNode.h"

@implementation FGBSTreeNode

- (instancetype)initWithData:(FGBSTreeObject *)data
{
    if (self = [super init]) {
        _data = data;
    }
    
    return self;
}

- (void)enumerateNodeByUsingBlock:(void (^)(FGBSTreeObject *object))block withOrderType:(FGTreeOrderType)type {
    if (!block) return;
    if (type == FGTreeOrderTypePreOrder) {
        
    } else if (type == FGTreeOrderTypeInOrder) {
        [self.left enumerateNodeByUsingBlock:block withOrderType:FGTreeOrderTypeInOrder];
        block(self.data);
        [self.right enumerateNodeByUsingBlock:block withOrderType:FGTreeOrderTypeInOrder];
    } else {
        
    }
    
}

@end
