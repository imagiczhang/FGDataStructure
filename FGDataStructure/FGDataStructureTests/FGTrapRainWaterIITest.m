//
//  FGTrapRainWaterIITest.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 26/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGTrapRainWaterII.h"

@interface FGTrapRainWaterIITest : XCTestCase

@end

@implementation FGTrapRainWaterIITest

- (void)testExample {
    //Given 5*4 matrix
    //
    //[12,13,0,12]
    //[13,4,13,12]
    //[13,8,10,12]
    //[12,13,12,12]
    //[13,13,13,13]
    //return 14.
    NSArray *testData = @[@[@12,@13,@0,@12],
                          @[@13,@4,@13,@12],
                          @[@13,@8,@10,@12],
                          @[@12,@13,@12,@12],
                          @[@13,@13,@13,@13]];
    XCTAssert([FGTrapRainWaterII waterTrappedByBoard:testData] == 14);
}

@end
