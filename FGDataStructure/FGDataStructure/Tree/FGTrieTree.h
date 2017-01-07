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

- (void)addWord:(NSString *)word;
- (BOOL)isWordFound:(NSString *)word;
- (BOOL)isWord:(NSString *)word foundFrom:(FGTrieTreeNode *)node;
//- (BOOL)hasWordWithPattern:(NSString *)pattern;

@end
