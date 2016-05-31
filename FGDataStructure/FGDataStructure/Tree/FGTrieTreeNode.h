//
//  FGTrieTreeNode.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 26/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FGTrieTreeNode : NSObject

@property (nonatomic, copy, readonly) NSString *value;
@property (nonatomic, strong, readonly) NSMutableDictionary *children;

- (instancetype)initWithValue:(NSString *)value;
- (void)addWord:(NSString *)word;
- (BOOL)isFinal;
- (BOOL)isFindWord:(NSString *)word index:(NSInteger)index;

@end
