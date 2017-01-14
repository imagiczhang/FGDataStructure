//
//  FGWordSearchII.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 14/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import "FGWordSearchII.h"
#import "FGAddSearchWord.h"

@interface FGWordSearchII()

@property (nonatomic, strong) FGAddSearchWord *trie;
@property (nonatomic, strong) NSMutableSet<NSString *> *result;
@property (nonatomic, strong) NSMutableArray<NSMutableArray<NSNumber *> *> *visited;

@end

@implementation FGWordSearchII

- (instancetype)initWithWords:(NSArray<NSString *> *)words
{
    if (self = [super init]) {
        _trie = [[FGAddSearchWord alloc] init];
        for (NSString *word in words) {
            [_trie addWord:word];
        }
    }
    return self;
}

- (NSArray<NSString *> *)wordsInBoard:(NSArray<NSArray<NSString *> *> *)board
{
    self.result = [NSMutableSet set];
    
    NSInteger n = board.count;
    if (n == 0) {
        return [self.result copy];
    }
    NSInteger m = board[0].count;
    if (m == 0) {
        return [self.result copy];
    }
    
    self.visited = [NSMutableArray array];
    for (int i = 0; i < n; i++) {
        [self.visited addObject:[NSMutableArray array]];
        for (int j = 0; j < m; j++) {
            [self.visited[i] addObject:@NO];
        }
    }
    
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            [self searchWordsFromX:i y:j inBoard:board fromTrieNode:self.trie.root];
        }
    }
    
    return [self.result allObjects];
}

- (void)searchWordsFromX:(NSInteger)x y:(NSInteger)y inBoard:(NSArray<NSArray<NSString *> *> *)board fromTrieNode:(FGWordTreeNode *)node
{
    FGWordTreeNode *current = node;
    NSString *character = board[x][y];
    if (current.children[character]) {
        FGWordTreeNode *nextNode = current.children[character];
        if(nextNode.isWord){
            [self.result addObject:nextNode.word];
        }
        
        self.visited[x][y] = @YES;
        NSInteger n = board.count;
        NSInteger m = board[0].count;
        
        if (x > 0 && !self.visited[x-1][y].boolValue) {
            [self searchWordsFromX:x-1 y:y inBoard:board fromTrieNode:nextNode];
        }
        
        if (x < n-1 && !self.visited[x+1][y].boolValue) {
            [self searchWordsFromX:x+1 y:y inBoard:board fromTrieNode:nextNode];
        }
        
        if (y > 0 && !self.visited[x][y-1].boolValue) {
            [self searchWordsFromX:x y:y-1 inBoard:board fromTrieNode:nextNode];
        }
        
        if (y < m-1 && !self.visited[x][y+1].boolValue) {
            [self searchWordsFromX:x y:y+1 inBoard:board fromTrieNode:nextNode];
        }
        
        self.visited[x][y] = @NO;
    }
}

@end
