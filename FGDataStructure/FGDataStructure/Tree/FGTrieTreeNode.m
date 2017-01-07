//
//  FGTrieTreeNode.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 26/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGTrieTreeNode.h"

@interface FGTrieTreeNode ()

@property (nonatomic, strong) NSMutableArray *filteredWords;

@end

@implementation FGTrieTreeNode

//- (instancetype)initWithValue:(NSString *)value {
//    if (self = [super init]) {
//        _value = value;
//        _children = [NSMutableDictionary dictionary];
//    }
//    
//    return self;
//}
//
//- (void)addWord:(NSString *)word {
//    if (word.length == 0) return;
//    
//    NSString *firstCharacter = [word substringWithRange:NSMakeRange(0, 1)];
//    NSString *restCharacters = [word substringFromIndex:1];
//    
//    if ([_children objectForKey:firstCharacter]) {
//        [[_children objectForKey:firstCharacter] addWord:restCharacters];
//    } else {
//        FGTrieTreeNode *newNode = [[FGTrieTreeNode alloc] initWithValue:firstCharacter];
//        [_children setObject:newNode forKey:firstCharacter];
//        [newNode addWord:restCharacters];
//    }
//}
//
//- (BOOL)isFinal {
//    return (_children.count == 0);
//}
//
//- (BOOL)isFindWord:(NSString *)word index:(NSInteger)index {
//    if(index == word.length) {
//        return [self isFinal];
//    }
//    
//    NSString *c = [word substringWithRange:NSMakeRange(index, 1)];
//    if ([self.children objectForKey:c]) {
//        if(index == word.length - 1 && [[self.children objectForKey:c] isFinal]){
//            return YES;
//        }
//        return [self.children[c] isFindWord:word index:index + 1];
//    } else if ([c isEqualToString:@"."]) {
//        BOOL result = NO;
//        for (FGTrieTreeNode *child in self.children.allValues) {
//            if (index == word.length - 1 && [child isFinal]) {
//                return YES;
//            }
//            
//            //if any path is true, set result to be true;
//            result = [child isFindWord:word index:index + 1];
//        }
//        return result;
//    }
//    
//    return NO;
//}


//- (NSArray *)filterWordWithPattern:(NSString *)pattern {
//    self.filteredWords = [NSMutableArray array];
//    
//    NSDictionary *currentDictionary = self.children;
//    
//    for (NSInteger i = 0; i < pattern.length; i++) {
//        NSString *currentCharacter = [pattern substringWithRange:NSMakeRange(i, 1)];
//        
//        if ([currentCharacter isEqualToString:@"."]) {
//            
//        } else {
//            for ()
//            
//            FGTrieTreeNode *node = currentDictionary[currentCharacter];
//            if (node) {
//                
//            } else {
//                return nil;
//            }
//        }
//    }
//    
//    return self.filteredWords;
//    
//}
//
//- (FGTrieTreeNode *)findNodeByKeyPath:(NSString *)keyPath {
//    NSDictionary *currentDictionary = self.children;
//    FGTrieTreeNode *currentNode;
//    for (NSInteger i = 0; i < keyPath.length; i++) {
//        currentNode = currentDictionary[[keyPath substringWithRange:NSMakeRange(i, 0)]];
//        currentDictionary = currentNode.children;
//    }
//    
//    return currentNode;
//}
//

- (instancetype)init
{
    if (self = [super init]) {
        _children = [NSMutableDictionary dictionary];
        _isWord = NO;
    }
    return self;
}

@end
