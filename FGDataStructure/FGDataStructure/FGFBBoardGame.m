//
//  FGFBBoardGame.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 26/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import "FGFBBoardGame.h"

@interface FGFBBoardGame()

@property (nonatomic, strong) NSArray<NSArray<NSNumber *> *> *board;
@property (nonatomic, strong) NSMutableArray<FGFBBoardGamePoint *> *path;
@property (nonatomic, strong) NSMutableArray<NSArray<FGFBBoardGamePoint *> *> *result;

@end

@implementation FGFBBoardGamePoint

- (instancetype)initWithX:(NSInteger)x y:(NSInteger)y
{
    if (self = [super init]) {
        _x = x;
        _y = y;
    }
    return self;
}

@end

@implementation FGFBBoardGame

- (instancetype)initWithBoard:(NSArray<NSArray<NSNumber *> *> *)board
{
    if (self = [super init]) {
        _board = board;
        _path = [NSMutableArray array];
        _result = [NSMutableArray array];
    }
    return self;
}

- (NSArray<NSArray<FGFBBoardGamePoint *> *> *)pathsToPoint:(FGFBBoardGamePoint *)point
{
    [self recordPathsFromPoint:[[FGFBBoardGamePoint alloc] initWithX:0 y:0] toPoint:point];
    return [self.result copy];
}

- (void)recordPathsFromPoint:(FGFBBoardGamePoint *)source toPoint:(FGFBBoardGamePoint *)target
{
    [self.path addObject:source];
    if (source.x == target.x && source.y == target.y) {
        [self.result addObject:[self.path copy]];
    } else if (source.x <= target.x && source.y <= target.y) {
        NSInteger n = self.board.count;
        NSInteger m = self.board[0].count;
        if (source.x < n-1 && self.board[source.x+1][source.y].integerValue == 0) {
            [self recordPathsFromPoint:[[FGFBBoardGamePoint alloc] initWithX:source.x+1 y:source.y] toPoint:target];
        }
        if (source.y < m-1 && self.board[source.x][source.y+1].integerValue == 0) {
            [self recordPathsFromPoint:[[FGFBBoardGamePoint alloc] initWithX:source.x y:source.y+1] toPoint:target];
        }
    }
    [self.path removeLastObject];
}

@end
