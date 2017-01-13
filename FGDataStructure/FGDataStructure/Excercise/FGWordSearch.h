//
//  FGWordSearch.h
//  FGDataStructure
//
//  Created by Stephen Zhang on 13/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

//Given a 2D board and a word, find if the word exists in the grid.
//
//The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.
//Example
//Given board =
//
//[
// "ABCE",
// "SFCS",
// "ADEE"
// ]
//word = "ABCCED", -> returns true,
//word = "SEE", -> returns true,
//word = "ABCB", -> returns false.

@interface FGWordSearch : NSObject

+ (BOOL)isWord:(NSString *)word existInBoard:(NSArray<NSArray<NSString *> *> *)board;

@end
