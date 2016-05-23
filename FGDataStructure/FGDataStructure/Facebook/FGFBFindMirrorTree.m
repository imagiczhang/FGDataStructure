//
//  FGFBFindMirrorTree.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 18/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGFBFindMirrorTree.h"
#import "FGFBFindMirrorTreeStructure.h"
#import "FGFBFindMirrorTreeNode.h"
#import "FGFBFindMirrorData.h"

@implementation FGFBFindMirrorTree

+ (FGFBFindMirrorTreeNode *)findMirrorNodeWithOriginalNode:(FGFBFindMirrorTreeNode *)originalNode withTree:(FGFBFindMirrorTreeStructure *)tree cloneTree:(FGFBFindMirrorTreeStructure *)cloneTree {
    
    NSMutableArray *pathes = [NSMutableArray array];
    FGFBFindMirrorTreeNode *currentNode = originalNode;
    
    // o(l*n)
    while (currentNode.parent) {
        FGFBFindMirrorTreeNode *parent = currentNode.parent;
        NSInteger currentIndex = [parent.children indexOfObject:currentNode]; //o(n)
        [pathes addObject:@(currentIndex)];
        currentNode = parent;
    }
    
    NSArray *currentChildren = cloneTree.root.children;
    
    // o(l)
    for (NSInteger index = pathes.count - 2; index >= 0; index--) {
        NSInteger currentIndex = [pathes[index] integerValue];
        if (currentIndex >= currentChildren.count) {
            NSAssert(NO, @"Tree is not cloned!!");
        }
        
        FGFBFindMirrorTreeNode *currentNode = currentChildren[currentIndex];
        
        if (index == 0) {
            return currentNode;
        } else {
            currentChildren = currentNode.children;
        }
        
    }
    
    return nil;
}

@end
