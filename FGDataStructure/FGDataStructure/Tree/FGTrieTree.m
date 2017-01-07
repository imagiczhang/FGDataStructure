//
//  FGTrieTree.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 26/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGTrieTree.h"
#import "FGTrieTreeNode.h"

@interface FGTrieTree()

@property (nonatomic, strong) FGTrieTreeNode *root;

@end

@implementation FGTrieTree

- (instancetype)init {
    if (self = [super init]) {
        _root = [[FGTrieTreeNode alloc] init];
    }
    
    return self;
}

- (void)addWord:(NSString *)word {
    if (word && word.length > 0) {
        __block FGTrieTreeNode *current = self.root;
        [word enumerateSubstringsInRange:NSMakeRange(0, word.length)
                                 options:NSStringEnumerationByComposedCharacterSequences
                              usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
                                  if(current.children[substring]) {
                                      current = current.children[substring];
                                  } else {
                                      current.children[substring] = [[FGTrieTreeNode alloc] init];
                                      current = current.children[substring];
                                  }
                              }];
        current.isWord = YES;
    }
}

- (BOOL)isWordFound:(NSString *)word {
    return [self isWord:word foundFrom:self.root];
}

- (BOOL)isWord:(NSString *)word foundFrom:(FGTrieTreeNode *)node {
    if (word) {
        __block FGTrieTreeNode *current = node;
        __block BOOL result;
        if (word.length == 0) {
            return current.isWord;
        }
        [word enumerateSubstringsInRange:NSMakeRange(0, word.length)
                                 options:NSStringEnumerationByComposedCharacterSequences
                              usingBlock:^(NSString * substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                  if ([substring isEqualToString:@"."]) {
                                      NSString *nextWord;
                                      if (substringRange.location == word.length - 1) {
                                          nextWord = @"";
                                      } else {
                                          nextWord = [word substringFromIndex:substringRange.location+1];
                                      }
                                      result = NO;
                                      for (FGTrieTreeNode *child in current.children.allValues) {
                                          if ([self isWord:nextWord foundFrom:child]) {
                                              result = YES;
                                              break;
                                          }
                                      }
                                      *stop = YES;
                                  } else if (current.children[substring]) {
                                      current = current.children[substring];
                                      if (substringRange.location == word.length - 1) {
                                          result = current.isWord;
                                          *stop = YES;
                                      }
                                  } else {
                                      result = NO;
                                      *stop = YES;
                                  }
                              }];
        return result;
    }
    return NO;
}

@end
