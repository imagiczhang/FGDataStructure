//
//  FGHRArrayDSTest.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 4/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+FGHRArrayDS.h"

@interface FGHRArrayDSTest : XCTestCase

@end

@implementation FGHRArrayDSTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testReversed {
    NSArray *testArray1 = @[@1, @4, @3, @2];
    NSArray *testArray1Reversed = @[@2, @3, @4, @1];
    XCTAssertTrue([[testArray1 reverse] isEqualToArray:testArray1Reversed]);
    
    NSArray *testArray2 = @[@1, @4, @3, @2, @6];
    NSArray *testArray2Reversed = @[@6, @2, @3, @4, @1];
    XCTAssertTrue([[testArray2 reverse] isEqualToArray:testArray2Reversed]);
}

@end
