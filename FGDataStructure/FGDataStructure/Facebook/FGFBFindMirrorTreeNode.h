//
//  FGFBFindMirrorTreeNode.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 18/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FGFBFindMirrorData;
@interface FGFBFindMirrorTreeNode : NSObject <NSCopying>

@property (nonatomic, strong) NSArray<FGFBFindMirrorTreeNode *> *children;
@property (nonatomic, weak) FGFBFindMirrorTreeNode *parent;
@property (nonatomic, strong) FGFBFindMirrorData *data;

- (instancetype)initWithData:(FGFBFindMirrorData *)data Parent:(FGFBFindMirrorTreeNode *)parent TreeNode:(NSArray<FGFBFindMirrorTreeNode *> *)children;

@end
