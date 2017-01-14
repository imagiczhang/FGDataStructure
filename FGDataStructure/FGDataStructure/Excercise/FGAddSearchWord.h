//
//  FGAddSearchWord.h
//  FGDataStructure
//
//  Created by Stephen Zhang on 13/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

//Design a data structure that supports the following two operations: addWord(word) and search(word)
//
//search(word) can search a literal word or a regular expression string containing only letters a-z or ..
//
//A . means it can represent any one letter.
//
//Notice
//
//You may assume that all words are consist of lowercase letters a-z.
//Example
//addWord("bad")
//addWord("dad")
//addWord("mad")
//search("pad")  // return false
//search("bad")  // return true
//search(".ad")  // return true
//search("b..")  // return true

@interface FGWordTreeNode : NSObject

@property (nonatomic, strong) NSMutableDictionary<NSString *, FGWordTreeNode *> *children;
@property (nonatomic) BOOL isWord;
@property (nonatomic, copy) NSString *word;

@end

@interface FGAddSearchWord : NSObject

@property (nonatomic, strong, readonly) FGWordTreeNode *root;

- (void)addWord:(NSString *)word;
- (BOOL)searchWord:(NSString *)word;

@end
