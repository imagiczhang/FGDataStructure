//
//  FGAddSearchWord.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 13/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import "FGAddSearchWord.h"

@implementation FGWordTreeNode

- (instancetype)init
{
    if (self = [super init]) {
        _children = [NSMutableDictionary dictionary];
        _isWord = NO;
    }
    return self;
}

@end

@implementation FGAddSearchWord

- (instancetype)init
{
    if (self = [super init]) {
        _root = [[FGWordTreeNode alloc] init];
    }
    return self;
}

- (void)addWord:(NSString *)word
{
    __block FGWordTreeNode *current = self.root;
    [word enumerateSubstringsInRange:NSMakeRange(0, word.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        if (substring) {
            if (!current.children[substring]) {
                FGWordTreeNode *node = [[FGWordTreeNode alloc] init];
                current.children[substring] = node;
            }
            current = current.children[substring];
        }
    }];
    if (current != self.root) {
        current.isWord = YES;
        current.word = word;
    }
}

- (BOOL)searchWord:(NSString *)word
{
    return [self searchWord:word fromNode:self.root];
}

- (BOOL)searchWord:(NSString *)word fromNode:(FGWordTreeNode *)node
{
    FGWordTreeNode *current = node;
    for (int i = 0; i < word.length; i++) {
        NSString *substring = [word substringWithRange:NSMakeRange(i, 1)];
        if ([substring isEqualToString:@"."]) {
            NSString *subWord = (i == word.length - 1) ? @"" : [word substringWithRange:NSMakeRange(i+1, word.length - i - 1)];
            for (FGWordTreeNode *child in current.children.allValues) {
                if ([self searchWord:subWord fromNode:child]) {
                    return YES;
                }
            }
            return NO;
            
        }else if (!current.children[substring]) {
            return NO;
        } else {
            current = current.children[substring];
        }
    }
    
    return current.isWord;
}

@end
