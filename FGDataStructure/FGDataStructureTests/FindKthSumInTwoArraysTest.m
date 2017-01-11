//
//  FindKthSumInTwoArraysTest.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 9/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FindKthSumInTwoArrays.h"

@interface FindKthSumInTwoArraysTest : XCTestCase

@end

@implementation FindKthSumInTwoArraysTest

- (void)testExample {
    //Given [1, 7, 11] and [2, 4, 6].
    //
    //For k = 3, return 7.
    //
    //For k = 4, return 9.
    //
    //For k = 8, return 15.
    
    NSArray *array1 = @[@1, @7, @11];
    NSArray *array2 = @[@2, @4, @6];
    
    XCTAssert([FindKthSumInTwoArrays findKthSum:3 inArray:array1 andArray:array2] == 7);
    XCTAssert([FindKthSumInTwoArrays findKthSum:4 inArray:array1 andArray:array2] == 9);
    XCTAssert([FindKthSumInTwoArrays findKthSum:8 inArray:array1 andArray:array2] == 15);
}

@end
