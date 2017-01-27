//
//  FGFBBoardGameTest.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 27/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGFBBoardGame.h"

@interface FGFBBoardGameTest : XCTestCase

@end

@implementation FGFBBoardGameTest

- (void)testSuccess {
    NSArray *testData = @[@[@0,@0,@1,@1,@1],
                          @[@1,@0,@0,@1,@1],
                          @[@1,@1,@0,@0,@1],
                          @[@1,@1,@1,@0,@0],
                          @[@1,@1,@1,@1,@0]];
    FGFBBoardGame *boardGame = [[FGFBBoardGame alloc] initWithBoard:testData];
    NSArray<NSArray<FGFBBoardGamePoint *> *> *paths = [boardGame pathsToPoint:[[FGFBBoardGamePoint alloc] initWithX:4 y:4]];
    XCTAssert(paths.count == 1);
    NSArray<FGFBBoardGamePoint *> *path = [paths firstObject];
    XCTAssert(path.count == 9);
    XCTAssert(path[0].x == 0);
    XCTAssert(path[0].y == 0);
    XCTAssert(path[1].x == 0);
    XCTAssert(path[1].y == 1);
    XCTAssert(path[2].x == 1);
    XCTAssert(path[2].y == 1);
    XCTAssert(path[3].x == 1);
    XCTAssert(path[3].y == 2);
    XCTAssert(path[4].x == 2);
    XCTAssert(path[4].y == 2);
    XCTAssert(path[5].x == 2);
    XCTAssert(path[5].y == 3);
    XCTAssert(path[6].x == 3);
    XCTAssert(path[6].y == 3);
    XCTAssert(path[7].x == 3);
    XCTAssert(path[7].y == 4);
    XCTAssert(path[8].x == 4);
    XCTAssert(path[8].y == 4);
}

- (void)testMultiplePaths {
    NSArray *testData = @[@[@0,@0,@1,@1,@1],
                          @[@1,@0,@0,@1,@1],
                          @[@1,@1,@0,@0,@1],
                          @[@1,@1,@1,@0,@0],
                          @[@1,@1,@1,@0,@0]];
    FGFBBoardGame *boardGame = [[FGFBBoardGame alloc] initWithBoard:testData];
    NSArray<NSArray<FGFBBoardGamePoint *> *> *paths = [boardGame pathsToPoint:[[FGFBBoardGamePoint alloc] initWithX:4 y:4]];
    XCTAssert(paths.count == 2);
    NSArray<FGFBBoardGamePoint *> *path = [paths firstObject];
    XCTAssert(path.count == 9);
    XCTAssert(path[0].x == 0);
    XCTAssert(path[0].y == 0);
    XCTAssert(path[1].x == 0);
    XCTAssert(path[1].y == 1);
    XCTAssert(path[2].x == 1);
    XCTAssert(path[2].y == 1);
    XCTAssert(path[3].x == 1);
    XCTAssert(path[3].y == 2);
    XCTAssert(path[4].x == 2);
    XCTAssert(path[4].y == 2);
    XCTAssert(path[5].x == 2);
    XCTAssert(path[5].y == 3);
    XCTAssert(path[6].x == 3);
    XCTAssert(path[6].y == 3);
    XCTAssert(path[7].x == 4);
    XCTAssert(path[7].y == 3);
    XCTAssert(path[8].x == 4);
    XCTAssert(path[8].y == 4);
    path = [paths lastObject];
    XCTAssert(path.count == 9);
    XCTAssert(path[0].x == 0);
    XCTAssert(path[0].y == 0);
    XCTAssert(path[1].x == 0);
    XCTAssert(path[1].y == 1);
    XCTAssert(path[2].x == 1);
    XCTAssert(path[2].y == 1);
    XCTAssert(path[3].x == 1);
    XCTAssert(path[3].y == 2);
    XCTAssert(path[4].x == 2);
    XCTAssert(path[4].y == 2);
    XCTAssert(path[5].x == 2);
    XCTAssert(path[5].y == 3);
    XCTAssert(path[6].x == 3);
    XCTAssert(path[6].y == 3);
    XCTAssert(path[7].x == 3);
    XCTAssert(path[7].y == 4);
    XCTAssert(path[8].x == 4);
    XCTAssert(path[8].y == 4);
}

- (void)testFailure {
    NSArray *testData = @[@[@0,@0,@0,@0,@0],
                          @[@0,@0,@0,@0,@0],
                          @[@0,@0,@0,@0,@0],
                          @[@0,@0,@0,@0,@1],
                          @[@0,@0,@0,@1,@0]];
    FGFBBoardGame *boardGame = [[FGFBBoardGame alloc] initWithBoard:testData];
    NSArray<NSArray<FGFBBoardGamePoint *> *> *paths = [boardGame pathsToPoint:[[FGFBBoardGamePoint alloc] initWithX:4 y:4]];
    XCTAssert(paths.count == 0);
}

@end
