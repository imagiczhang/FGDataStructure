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

- (void)addObject:(FGBSTreeObject *)object
{
    if (!self.root) {
        [self createRootWithObject:object];
    } else {
        FGBSTreeNode *node = [[FGBSTreeNode alloc] initWithData:object];
        FGBSTreeNode *currentNode = self.root;
        
        while (YES) {
            NSComparisonResult result = (NSComparisonResult)[object performSelector:self.compareSelector withObject:self.root.data];
            if (result == NSOrderedAscending) {
                if (currentNode.left) {
                    currentNode = currentNode.left;
                } else {
                    currentNode.left = node;
                    break;
                }
            } else {
                currentNode = currentNode.right;
                if (currentNode.right) {
                    currentNode = currentNode.right;
                } else {
                    currentNode.right = node;
                    break;
                }
            }
        }
    }
}

- (void)enumerateTreeByUsingBlock:(void (^)(FGBSTreeObject *object))block withOrderType:(FGTreeOrderType)type {
    if (type == FGTreeOrderTypePreOrder) {
        
    }
    
}

#pragma mark - Internal

- (void)createRootWithObject:(FGBSTreeObject *)object
{
    self.root = [[FGBSTreeNode alloc] initWithData:object];
}

@end
