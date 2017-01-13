//
//  FGNumOfAirplanesTest.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 13/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGNumOfAirplanes.h"

@interface FGNumOfAirplanesTest : XCTestCase

@end

@implementation FGNumOfAirplanesTest

- (void)testExample {
    NSArray *testData = @[
                          @[@1, @10],
                          @[@2, @3],
                          @[@5, @8],
                          @[@4, @7]
                          ];
    XCTAssert([FGNumOfAirplanes maxPlanesInSkyWithFlightList:testData] == 3);
}

@end
