//
//  FGMinimalSizeSubarraySumTest.m
//  FGDataStructurelllll
//
//  Created by Stephen Zhang on 28/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGMinimalSizeSubarraySum.h"

@interface FGMinimalSizeSubarraySumTest : XCTestCase

@end

@implementation FGMinimalSizeSubarraySumTest

- (void)testExample {
    //Given the array [2,3,1,2,4,3] and s = 7, the subarray [4,3] has the minimal length under the problem constraint.
    NSArray *testData = @[@2, @3, @1, @2, @4, @3];
    XCTAssert([FGMinimalSizeSubarraySum minimalSizeSubarrayinArray:testData withSumLargerThan:7] == 2);
}

@end
