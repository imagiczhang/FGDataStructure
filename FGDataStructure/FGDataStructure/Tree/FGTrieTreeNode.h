//
//  FGTrieTreeNode.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 26/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FGTrieTreeNode : NSObject

@property (nonatomic, strong, readonly) NSMutableDictionary<NSString *, FGTrieTreeNode *> *children;
@property (nonatomic) BOOL isWord;

//- (instancetype)initWithValue:(NSString *)value;
//- (void)addWord:(NSString *)word;
//- (BOOL)isFindWord:(NSString *)word index:(NSInteger)index;

@end
