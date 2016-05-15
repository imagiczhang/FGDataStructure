//
//  FGFBQuestions.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 15/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGFBQuestions.h"

@interface FGFBQuestionsTest : XCTestCase

@end

@implementation FGFBQuestionsTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testArrayByMovingZeroWithNumbers {
    NSArray *data1 = @[@1, @0, @2, @0, @0, @3, @4];
    NSArray *data1Result = [FGFBQuestions arrayByMovingZeroWithNumbers:data1];
    XCTAssertTrue([data1Result[4] isEqualToNumber:@0]);
    XCTAssertTrue([data1Result[5] isEqualToNumber:@0]);
    XCTAssertTrue([data1Result[6] isEqualToNumber:@0]);
    XCTAssertTrue([data1Result containsObject:@1]);
    XCTAssertTrue([data1Result containsObject:@2]);
    XCTAssertTrue([data1Result containsObject:@3]);
    XCTAssertTrue([data1Result containsObject:@4]);
    XCTAssertTrue(data1Result.count == 7);
    
}

@end
