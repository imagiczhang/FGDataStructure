//
//  FGTrieTree.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 26/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGTrieTree.h"
#import "FGTrieTreeNode.h"

@implementation FGTrieTree

- (instancetype)init {
    if (self = [super init]) {
        _root = [[FGTrieTreeNode alloc] initWithValue:@""];
    }
    
    return self;
}

- (void)addWord:(NSString *)word {
    [self.root addWord:word];
}
//
//- (BOOL)hasWordWithPattern:(NSString *)pattern {
//    return [self.root hasWordWithPattern:pattern];
//}




@end
