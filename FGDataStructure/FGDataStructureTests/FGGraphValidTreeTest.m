//
//  FGGraphValidTreeTest.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 13/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGGraphValidTree.h"

@interface FGGraphValidTreeTest : XCTestCase

@end

@implementation FGGraphValidTreeTest

- (void)testExample {
    //Example
    //Given n = 5 and edges = [[0, 1], [0, 2], [0, 3], [1, 4]], return true.
    //
    //Given n = 5 and edges = [[0, 1], [1, 2], [2, 3], [1, 3], [1, 4]], return false.
    NSArray *edgesSet1 = @[@[@0, @1], @[@0, @2], @[@0, @3], @[@1, @4]];
    NSArray *edgesSet2 = @[@[@0, @1], @[@1, @2], @[@2, @3], @[@1, @3], @[@1, @4]];
    FGGraphValidTree *tree1 = [[FGGraphValidTree alloc] initWithN:5 edges:edgesSet1];
    FGGraphValidTree *tree2 = [[FGGraphValidTree alloc] initWithN:5 edges:edgesSet2];
    XCTAssert([tree1 isValidTree] == YES);
    XCTAssert([tree2 isValidTree] == NO);
}

@end
