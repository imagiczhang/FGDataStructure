//
//  FGDataStreamMedianTest.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 27/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGDataStreamMedian.h"

@interface FGDataStreamMedianTest : XCTestCase

@end

@implementation FGDataStreamMedianTest

- (void)testExample {
    //For numbers coming list: [1, 2, 3, 4, 5], return [1, 1, 2, 2, 3].
    //
    //For numbers coming list: [4, 5, 1, 3, 2, 6, 0], return [4, 4, 4, 3, 3, 3, 3].
    //
    //For numbers coming list: [2, 20, 100], return [2, 2, 20].
    NSArray *testData1 = @[@1, @2, @3, @4, @5];
    NSArray *testResult1 = @[@1, @1, @2, @2, @3];
    NSArray *testData2 = @[@4, @5, @1, @3, @2, @6, @0];
    NSArray *testResult2 = @[@4, @4, @4, @3, @3, @3, @3];
    NSArray *testData3 = @[@2, @20, @100];
    NSArray *testResult3 = @[@2, @2, @20];
    XCTAssert([[FGDataStreamMedian mediansForArray:testData1] isEqualToArray:testResult1]);
    XCTAssert([[FGDataStreamMedian mediansForArray:testData2] isEqualToArray:testResult2]);
    XCTAssert([[FGDataStreamMedian mediansForArray:testData3] isEqualToArray:testResult3]);
}

@end
