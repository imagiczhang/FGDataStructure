//
//  FGFBBoardGame.h
//  FGDataStructure
//
//  Created by Stephen Zhang on 26/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

//Given n x m board @0 on the board mean the location is allowed to pass, other than that the location is a wall
//If we only allow a person to move right and move down on the board, please return all the paths which allow a person
//to move from (0,0) to (x,y)

@interface FGFBBoardGamePoint : NSObject

@property (nonatomic, readonly) NSInteger x;
@property (nonatomic, readonly) NSInteger y;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithX:(NSInteger)x y:(NSInteger)y NS_DESIGNATED_INITIALIZER;

@end

@interface FGFBBoardGame : NSObject

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithBoard:(NSArray<NSArray<NSNumber *> *> *)board NS_DESIGNATED_INITIALIZER;
- (NSArray<NSArray<FGFBBoardGamePoint *> *> *)pathsToPoint:(FGFBBoardGamePoint *)point;

@end
