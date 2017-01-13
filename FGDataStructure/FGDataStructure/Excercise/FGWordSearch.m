//
//  FGWordSearch.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 13/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import "FGWordSearch.h"

@implementation FGWordSearch

+ (BOOL)isWord:(NSString *)word existInBoard:(NSArray<NSArray<NSString *> *> *)board
{
    NSInteger n = board.count;
    if (n == 0) {
        return NO;
    }
    
    NSInteger m = board[0].count;
    if (m == 0) {
        return NO;
    }
    
    if (!word || word.length == 0) {
        return NO;
    }
    
    NSMutableArray<NSMutableArray<NSNumber *> *> * visited = [NSMutableArray array];
    for (int i = 0; i < n; i++) {
        [visited addObject:[NSMutableArray array]];
        for (int j = 0; j < m; j++) {
            [visited[i] addObject:@NO];
        }
    }
    
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            if ([self searchWord:word fromX:i y:j inBoard:board withVisited:visited]) {
                return YES;
            }
        }
    }
    return NO;
}

+ (BOOL)searchWord:(NSString *)word fromX:(NSInteger)x y:(NSInteger)y inBoard:(NSArray<NSArray<NSString *> *> *)board withVisited:(NSArray<NSMutableArray<NSNumber *> *> *)visited
{
    if (word.length == 1) {
        return [board[x][y] isEqualToString:word];
    }
    
    NSString *character = [word substringWithRange:NSMakeRange(0, 1)];
    if (![board[x][y] isEqualToString:character]) {
        return NO;
    }
    
    NSString *nextWord = [word substringFromIndex:1];
    visited[x][y] = @YES;
    NSInteger n = board.count;
    NSInteger m = board[0].count;
    
    if (x > 0 && !visited[x-1][y].boolValue && [self searchWord:nextWord fromX:x-1 y:y inBoard:board withVisited:visited]) {
        return YES;
    }
    
    if (x < n-1 && !visited[x+1][y].boolValue && [self searchWord:nextWord fromX:x+1 y:y inBoard:board withVisited:visited]) {
        return YES;
    }
    
    if (y > 0 && !visited[x][y-1].boolValue && [self searchWord:nextWord fromX:x y:y-1 inBoard:board withVisited:visited]) {
        return YES;
    }
    
    if (y < m -1 && !visited[x][y+1].boolValue && [self searchWord:nextWord fromX:x y:y+1 inBoard:board withVisited:visited]) {
        return YES;
    }
    visited[x][y] = @NO;
    return NO;
}

@end
