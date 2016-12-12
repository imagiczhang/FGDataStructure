//
//  FGQuickSortTest.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 12/12/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGQuickSort.h"

@interface FGQuickSortTest : XCTestCase

@end

@implementation FGQuickSortTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testQuickSort {
    NSArray *data = @[@3, @5, @4, @3, @2, @1, @3];
    NSArray *expectation = @[@1,@2,@3,@3,@3,@4,@5];
    XCTAssertTrue([[FGQuickSort sortArray:data partitionType:FGQuickSortPartitionTypeHoare] isEqualToArray:expectation]);
    XCTAssertTrue([[FGQuickSort sortArray:data partitionType:FGQuickSortPartitionTypeLomuto] isEqualToArray:expectation]);
    XCTAssertTrue([[FGQuickSort sortArray:data partitionType:FGQuickSortPartitionType3Way] isEqualToArray:expectation]);
}

@end
