//
//  FGContainerWithMostWaterTest.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 29/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGContainerWithMostWater.h"

@interface FGContainerWithMostWaterTest : XCTestCase

@end

@implementation FGContainerWithMostWaterTest

- (void)testExample {
    //Given [1,3,2], the max area of the container is 2.
    NSArray *testData = @[@1, @3, @2];
    XCTAssert([FGContainerWithMostWater maxWaterInContainersOfArray:testData] == 2);
}

@end
