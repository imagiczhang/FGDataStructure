//
//  FGTriangleCountTest.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 10/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGTriangleCount.h"

@interface FGTriangleCountTest : XCTestCase

@end

@implementation FGTriangleCountTest

- (void)testExample {
    NSArray *testData1 = @[@7, @4, @6, @3];
    XCTAssert([FGTriangleCount findTriangleCountInArray:testData1] == 3);
    NSArray *testData2 = @[@4, @4, @4, @4];
    XCTAssert([FGTriangleCount findTriangleCountInArray:testData2] == 4);
}

@end
