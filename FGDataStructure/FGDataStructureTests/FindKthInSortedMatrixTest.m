//
//  FindKthInSortedMatrixTest.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 9/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FindKthInSortedMatrix.h"

@interface FindKthInSortedMatrixTest : XCTestCase

@end

@implementation FindKthInSortedMatrixTest

- (void)testExample {
    NSArray *testData = @[
                           @[@1 ,@5 ,@7],
                           @[@3 ,@7 ,@8],
                           @[@4 ,@8 ,@9],
                           ];
    XCTAssert([FindKthInSortedMatrix findKth:4 inMatrix:testData] == 5);
    XCTAssert([FindKthInSortedMatrix findKth:5 inMatrix:testData] == 7);
    XCTAssert([FindKthInSortedMatrix findKth:6 inMatrix:testData] == 7);
}

@end
