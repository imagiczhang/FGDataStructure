//
//  FGFBFindMirrorTreeStructure.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 18/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FGFBFindMirrorTreeNode;
@interface FGFBFindMirrorTreeStructure : NSObject <NSCopying>

@property (nonatomic, strong) FGFBFindMirrorTreeNode *root;

- (instancetype)initWithRoot:(FGFBFindMirrorTreeNode *)root;

@end
