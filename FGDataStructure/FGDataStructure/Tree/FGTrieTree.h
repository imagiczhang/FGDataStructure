//
//  FGTrieTree.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 26/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FGTrieTreeNode;
@interface FGTrieTree : NSObject

@property (nonatomic, strong) FGTrieTreeNode *root;

- (void)addWord:(NSString *)word;
- (BOOL)isFindWord:(NSString *)word;
//- (BOOL)hasWordWithPattern:(NSString *)pattern;

@end
