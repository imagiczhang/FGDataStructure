//
//  FGKLargestInNArraysTest.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 7/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGKLargestInNArrays.h"

@interface FGKLargestInNArraysTest : XCTestCase

@end

@implementation FGKLargestInNArraysTest


- (void)testExample {
    NSArray *testData = @[@[@6, @9, @3, @10, @13, @12],
                          @[@32, @111, @8, @33, @1, @2],
                          @[@5, @4, @15, @8, @46, @7],
                          @[@88, @96, @11, @14, @29, @18],
                          @[@98, @66, @19, @61, @16, @17],
                          @[@19, @21, @27, @25, @38, @41]];
    
    XCTAssert([FGKLargestInNArrays findKth:3 inArrays:testData] == 96);
    XCTAssert([FGKLargestInNArrays findKth:4 inArrays:testData] == 88);
    XCTAssert([FGKLargestInNArrays findKth:5 inArrays:testData] == 66);
    XCTAssert([FGKLargestInNArrays findKth:6 inArrays:testData] == 61);
}


@end
