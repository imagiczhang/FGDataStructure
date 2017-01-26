//
//  FGTrapRainWaterII.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 26/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import "FGTrapRainWaterII.h"
#import "FGHashHeap.h"

@interface FGBoardHeight : NSObject<NSCopying>

@property (nonatomic, readonly) NSInteger height;
@property (nonatomic, readonly) NSInteger x;
@property (nonatomic, readonly) NSInteger y;

- (instancetype)initWithHeight:(NSInteger)height x:(NSInteger)x y:(NSInteger)y NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;

@end

@implementation FGBoardHeight

- (instancetype)initWithHeight:(NSInteger)height x:(NSInteger)x y:(NSInteger)y
{
    if (self = [super init]) {
        _height = height;
        _x = x;
        _y = y;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

@end

@implementation FGTrapRainWaterII

+ (NSInteger)waterTrappedByBoard:(NSArray<NSArray<NSNumber *> *> *)board
{
    NSInteger n = board.count;
    if (n < 3) {
        return 0;
    }
    
    NSInteger m = board[0].count;
    if (m < 3) {
        return 0;
    }
    
    BOOL visited[n][m];
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            if (i == 0 || i == n-1 || j == 0 || j == m-1) {
                visited[i][j] = YES;
            } else {
                visited[i][j] = NO;
            }
        }
    }
    
    FGHashHeap<FGBoardHeight *> *closure = [[FGHashHeap alloc] initWithComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        FGBoardHeight *height1 = obj1;
        FGBoardHeight *height2 = obj2;
        
        if (height1.height < height2.height) {
            return NSOrderedAscending;
        } else if (height1.height > height2.height) {
            return NSOrderedDescending;
        } else {
            return NSOrderedSame;
        }
    }];
    
    for (int i = 1; i < n-1; i++) {
        [closure addItem:[[FGBoardHeight alloc] initWithHeight:board[i][0].integerValue x:i y:0]];
        [closure addItem:[[FGBoardHeight alloc] initWithHeight:board[i][m-1].integerValue x:i y:m-1]];
    }
    for (int j = 1; j < m-1; j++) {
        [closure addItem:[[FGBoardHeight alloc] initWithHeight:board[0][j].integerValue x:0 y:j]];
        [closure addItem:[[FGBoardHeight alloc] initWithHeight:board[n-1][j].integerValue x:n-1 y:j]];
    }
    
    NSInteger waterLevel = 0;
    NSInteger result = 0;
    
    while ([closure peek]) {
        FGBoardHeight *height = [closure poll];
        if (height.height > waterLevel) {
            waterLevel = height.height;
        }
        result += waterLevel - height.height;
        
        if (height.x > 0 && !visited[height.x - 1][height.y]) {
            [closure addItem:[[FGBoardHeight alloc] initWithHeight:board[height.x-1][height.y].integerValue x:height.x-1 y:height.y]];
            visited[height.x - 1][height.y] = YES;
        }
        if (height.x < n-1 && !visited[height.x + 1][height.y]) {
            [closure addItem:[[FGBoardHeight alloc] initWithHeight:board[height.x+1][height.y].integerValue x:height.x+1 y:height.y]];
            visited[height.x + 1][height.y] = YES;
        }
        if (height.y > 0 && !visited[height.x][height.y-1]) {
            [closure addItem:[[FGBoardHeight alloc] initWithHeight:board[height.x][height.y-1].integerValue x:height.x y:height.y-1]];
            visited[height.x][height.y - 1] = YES;
        }
        if (height.y < m-1 && !visited[height.x][height.y+1]) {
            [closure addItem:[[FGBoardHeight alloc] initWithHeight:board[height.x][height.y+1].integerValue x:height.x y:height.y+1]];
            visited[height.x][height.y + 1] = YES;
        }
    }
    
    return result;
}

@end
