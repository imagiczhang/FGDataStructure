//
//  FGFBFindMirrorTree.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 18/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FGFBFindMirrorTreeNode, FGFBFindMirrorTreeStructure;
@interface FGFBFindMirrorTree : NSObject

+ (FGFBFindMirrorTreeNode *)findMirrorNodeWithOriginalNode:(FGFBFindMirrorTreeNode *)originalNode withTree:(FGFBFindMirrorTreeStructure *)tree cloneTree:(FGFBFindMirrorTreeStructure *)cloneTree;

@end
