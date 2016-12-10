//
//  FGFBDynamicMedianTest.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 9/12/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGFBDynamicMedian.h"

@interface FGFBDynamicMedianTest : XCTestCase

@end

@implementation FGFBDynamicMedianTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMedian {
    //data added is @[@2, @7, @4, @9, @1, @5, @8, @3, @6];
    FGFBDynamicMedian *median = [[FGFBDynamicMedian alloc] init];
    [median addNumber:@2];
    XCTAssertTrue([[median median] isEqualToNumber:@2]);
    [median addNumber:@7];
    XCTAssertTrue([[median median] isEqualToNumber:@4.5]);
    [median addNumber:@4];
    XCTAssertTrue([[median median] isEqualToNumber:@4]);
    [median addNumber:@9];
    XCTAssertTrue([[median median] isEqualToNumber:@5.5]);
    [median addNumber:@1];
    XCTAssertTrue([[median median] isEqualToNumber:@4]);
    [median addNumber:@5];
    XCTAssertTrue([[median median] isEqualToNumber:@4.5]);
    [median addNumber:@8];
    XCTAssertTrue([[median median] isEqualToNumber:@5]);
    [median addNumber:@3];
    XCTAssertTrue([[median median] isEqualToNumber:@4.5]);
    [median addNumber:@6];
    XCTAssertTrue([[median median] isEqualToNumber:@5]);
}

@end
