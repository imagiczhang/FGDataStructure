//
//  NSMutableArray+FGQuickSortTest.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 30/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+FGQuickSort.h"

@interface NSMutableArray_FGQuickSortTest : XCTestCase

@end

@implementation NSMutableArray_FGQuickSortTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSorting {
    NSArray *unsortedArray = @[@10, @12, @4, @36, @8, @42, @1];
    NSArray *sortedArray = @[@1, @4, @8, @10, @12, @36, @42];
    XCTAssertTrue([[unsortedArray quickSort] isEqualToArray:sortedArray]);
}

@end
