//
//  FGFBCircularBarCodeTest.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 12/02/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGFBCircularBarCode.h"

@interface FGFBCircularBarCodeTest : XCTestCase

@end

@implementation FGFBCircularBarCodeTest

- (void)testDrawBarcode {
    NSArray<NSString *> *result = [FGFBCircularBarCode drawBarcodeWithCode:@"11111"];
    XCTAssert(result.count == 1);
    XCTAssert([[result firstObject] isEqualToString:@"drawAt(0, 4)"]);
    result = [FGFBCircularBarCode drawBarcodeWithCode:@"00000"];
    XCTAssert(result.count == 0);
    result = [FGFBCircularBarCode drawBarcodeWithCode:@"10101"];
    XCTAssert(result.count == 3);
    XCTAssert([result[0] isEqualToString:@"drawAt(0, 0)"]);
    XCTAssert([result[1] isEqualToString:@"drawAt(2, 0)"]);
    XCTAssert([result[2] isEqualToString:@"drawAt(4, 0)"]);
    result = [FGFBCircularBarCode drawBarcodeWithCode:@"10111"];
    XCTAssert(result.count == 2);
    XCTAssert([result[0] isEqualToString:@"drawAt(0, 0)"]);
    XCTAssert([result[1] isEqualToString:@"drawAt(2, 2)"]);
}

- (void)testDrawCircularBarcode {
    NSArray<NSString *> *result = [FGFBCircularBarCode drawCircularBarcodeWithCode:@"11111"];
    XCTAssert(result.count == 1);
    XCTAssert([[result firstObject] isEqualToString:@"drawAt(0, 5)"]);
    result = [FGFBCircularBarCode drawCircularBarcodeWithCode:@"00000"];
    XCTAssert(result.count == 0);
    result = [FGFBCircularBarCode drawCircularBarcodeWithCode:@"10101"];
    XCTAssert(result.count == 2);
    XCTAssert([result[0] isEqualToString:@"drawAt(2, 0)"]);
    XCTAssert([result[1] isEqualToString:@"drawAt(4, 1)"]);
    result = [FGFBCircularBarCode drawCircularBarcodeWithCode:@"10111"];
    XCTAssert(result.count == 1);
    XCTAssert([result[0] isEqualToString:@"drawAt(2, 3)"]);
}

@end
