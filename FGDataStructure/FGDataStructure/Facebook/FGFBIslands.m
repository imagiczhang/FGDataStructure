//
//  FGFBIslands.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 8/12/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGFBIslands.h"

@interface FGFBIslandPoint : NSObject 

- (instancetype)initWithX:(NSUInteger)x Y:(NSUInteger)y;
@property (nonatomic) NSUInteger x;
@property (nonatomic) NSUInteger y;

@end

@implementation FGFBIslandPoint

- (instancetype)initWithX:(NSUInteger)x Y:(NSUInteger)y
{
    if (self = [super init]) {
        _x = x;
        _y = y;
    }
    return self;
}

@end

@implementation FGFBIslands

+ (NSUInteger)countOfIslandsInMap:(NSArray<NSArray<NSString *> *> *)map
{
    NSUInteger rows = [map count];
    NSAssert(rows > 0, @"map should have at least one row");
    NSUInteger columns = [[map firstObject] count];
    NSAssert(columns > 0, @"map should have at least one column");
    
    //create the mutable bitmap
    NSMutableArray<NSMutableArray<NSNumber *> *> *bitmap = [NSMutableArray array];
    for (int i = 0; i < rows; i++) {
        NSMutableArray<NSNumber *> *row = [NSMutableArray array];
        for (int j = 0; j < columns; j++) {
            [row addObject:@([[map[i][j] lowercaseString] isEqualToString:@"x"])];
        }
        [bitmap addObject:row];
    }
    
    //traverse the bitmap
    NSUInteger countOfIslands = 0;
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < columns; j++) {
            if ([bitmap[i][j] boolValue]) {
                [self bfsFillBitmap:bitmap row:i column:j];
                countOfIslands++;
            }
        }
    }
    
    return countOfIslands;
}

+ (void)bfsFillBitmap:(NSMutableArray<NSMutableArray<NSNumber *> *> *)bitmap row:(NSUInteger)row column:(NSUInteger)column
{
    NSUInteger rows = [bitmap count];
    NSAssert(rows > 0, @"map should have at least one row");
    NSUInteger columns = [[bitmap firstObject] count];
    NSAssert(columns > 0, @"map should have at least one column");
    bitmap[row][column] = @NO;
    
    //BFS Fill
    NSMutableArray<FGFBIslandPoint *> *jobQueue = [NSMutableArray array];
    [jobQueue addObject:[[FGFBIslandPoint alloc] initWithX:row Y:column]];
    while ([jobQueue firstObject]) {
        FGFBIslandPoint *position = [jobQueue firstObject];
        NSUInteger x = position.x;
        NSUInteger y = position.y;
        [jobQueue removeObjectAtIndex:0];
        
        if (x > 0 && [bitmap[x-1][y] boolValue]) {
            [jobQueue addObject:[[FGFBIslandPoint alloc] initWithX:x-1 Y:y]];
            bitmap[x-1][y] = @NO;
        }
        
        if (x < rows - 1  && [bitmap[x+1][y] boolValue]) {
            [jobQueue addObject:[[FGFBIslandPoint alloc] initWithX:x+1 Y:y]];
            bitmap[x+1][y] = @NO;
        }
        
        if (y > 0 && [bitmap[x][y-1] boolValue]) {
            [jobQueue addObject:[[FGFBIslandPoint alloc] initWithX:x Y:y-1]];
            bitmap[x][y-1] = @NO;
        }
        
        if (y < columns - 1  && [bitmap[x][y+1] boolValue]) {
            [jobQueue addObject:[[FGFBIslandPoint alloc] initWithX:x Y:y+1]];
            bitmap[x][y+1] = @NO;
        }
    }
}

@end
