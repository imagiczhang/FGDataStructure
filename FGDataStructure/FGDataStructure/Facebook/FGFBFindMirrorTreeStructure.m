//
//  FGFBFindMirrorTreeStructure.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 18/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGFBFindMirrorTreeStructure.h"
#import "FGFBFindMirrorTreeNode.h"

@implementation FGFBFindMirrorTreeStructure

- (instancetype)initWithRoot:(FGFBFindMirrorTreeNode *)root {
    if (self = [super init]) {
        _root = root;
    }
    
    return self;
}

@end
