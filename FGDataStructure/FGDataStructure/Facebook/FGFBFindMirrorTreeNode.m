//
//  FGFBFindMirrorTreeNode.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 18/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGFBFindMirrorTreeNode.h"
#import "FGFBFindMirrorData.h"

@implementation FGFBFindMirrorTreeNode

- (instancetype)initWithData:(id)data Parent:(FGFBFindMirrorTreeNode *)parent TreeNode:(NSArray<FGFBFindMirrorTreeNode *> *)children {
    if (self = [super init]) {
        _parent = parent;
        _children = children;
        _data = data;
    }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    FGFBFindMirrorTreeNode *node = [[FGFBFindMirrorTreeNode alloc] init];
    
    node.parent = _parent.copy;
    node.children = [[NSArray alloc] initWithArray:_children copyItems:YES];
    node.data = _data.copy;
    
    return node;
}

@end
