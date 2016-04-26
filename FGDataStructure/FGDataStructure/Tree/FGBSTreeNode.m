//
//  FGTreeNode.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 23/04/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGBSTreeNode.h"

@implementation FGBSTreeNode

- (instancetype)initWithData:(NSObject *)data
{
    if (self = [super init]) {
        _data = data;
    }
    
    return self;
}

@end
