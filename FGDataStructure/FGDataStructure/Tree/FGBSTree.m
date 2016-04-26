//
//  FGTree.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 23/04/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGBSTree.h"
#import "FGBSTreeNode.h"

@interface FGBSTree ()

@property (nonatomic, strong) FGBSTreeNode *root;
@property (nonatomic, assign) SEL compareSelector;

@end

@implementation FGBSTree

- (instancetype)initWithCompareSelector:(SEL)selector
{
    if (self = [super init]) {
        _compareSelector = selector;
    }
    
    return self;
}

- (void)addObject:(NSObject *)object
{
    if (!self.root) {
        [self createRootWithObject:object];
    } else {
        FGBSTreeNode *node = [[FGBSTreeNode alloc] initWithObject:object];
        
        NSCompareResult *compareResult = [NSCompareResult alloc] ini
    }
}

#pragma mark - Internal

- (void)createRootWithObject:(NSObject *)object
{
    self.root = [[FGBSTreeNode alloc] initWithObject:object];
    
}

@end
