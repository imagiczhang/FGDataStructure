//
//  FGTwoSumIITest.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 8/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGTwoSumII.h"

@interface FGTwoSumIITest : XCTestCase

@end

@implementation FGTwoSumIITest


- (void)testTwoSumII {
    NSArray *testData = @[@2, @7, @11, @15];
    XCTAssert([FGTwoSumII findPairsLargerThanTarget:24 inArray:testData] == 1);
    XCTAssert([FGTwoSumII findPairsLargerThanTarget:9 inArray:testData] == 5);
    XCTAssert([FGTwoSumII findPairsLargerThanTarget:18 inArray:testData] == 2);
}


@end
