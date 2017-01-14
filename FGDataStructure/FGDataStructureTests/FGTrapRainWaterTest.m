//
//  FGTrapRainWaterTest.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 14/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGTrapRainWater.h"

@interface FGTrapRainWaterTest : XCTestCase

@end

@implementation FGTrapRainWaterTest

- (void)testExample {
    NSArray *testData = @[@0, @1, @0, @2, @1, @0, @1, @3, @2, @1, @2, @1];
    XCTAssert([FGTrapRainWater waterTrappedWithHeights:testData] == 6);
}

@end
