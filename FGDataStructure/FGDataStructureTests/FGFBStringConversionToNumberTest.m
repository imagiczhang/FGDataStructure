//
//  FGFBStringConversionToNumberTest.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 12/02/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGFBStringConversionToNumber.h"

@interface FGFBStringConversionToNumberTest : XCTestCase

@end

@implementation FGFBStringConversionToNumberTest

- (void)testIntegerConversion {
    XCTAssert([FGFBStringConversionToNumber integerFromString:@"123"] == 123);
    XCTAssert([FGFBStringConversionToNumber integerFromString:@"-123"] == -123);
    XCTAssert([FGFBStringConversionToNumber integerFromString:@"0123"] == 123);
    XCTAssert([FGFBStringConversionToNumber integerFromString:@"-0123"] == -123);
}

@end
