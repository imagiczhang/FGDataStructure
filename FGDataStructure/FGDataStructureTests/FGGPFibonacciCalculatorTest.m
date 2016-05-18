//
//  FGGPFibonacciCalculatorTest.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 18/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGGPFibonacciCalculator.h"

@interface FGGPFibonacciCalculatorTest : XCTestCase

@end

@implementation FGGPFibonacciCalculatorTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test {
    //0, 1, 1, 2, 3, 5, 8, 13, 21, 34
    XCTAssertTrue([FGGPFibonacciCalculator fibonacciInN:0] == 0);
    XCTAssertTrue([FGGPFibonacciCalculator fibonacciInN:1] == 1);
    XCTAssertTrue([FGGPFibonacciCalculator fibonacciInN:2] == 1);
    XCTAssertTrue([FGGPFibonacciCalculator fibonacciInN:3] == 2);
    XCTAssertTrue([FGGPFibonacciCalculator fibonacciInN:4] == 3);
    XCTAssertTrue([FGGPFibonacciCalculator fibonacciInN:5] == 5);
    XCTAssertTrue([FGGPFibonacciCalculator fibonacciInN:6] == 8);
    XCTAssertTrue([FGGPFibonacciCalculator fibonacciInN:7] == 13);
}



@end
