//
//  FGFBTelephoneKeypadTest.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 18/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGFBTelephoneKeypad.h"

@interface FGFBTelephoneKeypadTest : XCTestCase

@end

@implementation FGFBTelephoneKeypadTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAllCombinations {
    NSArray *data1 = [FGFBTelephoneKeypad allCombinations:23];
    XCTAssertTrue([data1 containsObject:@"AD"]);
    XCTAssertTrue([data1 containsObject:@"AE"]);
    XCTAssertTrue([data1 containsObject:@"AF"]);
    XCTAssertTrue([data1 containsObject:@"BD"]);
    XCTAssertTrue([data1 containsObject:@"BE"]);
    XCTAssertTrue([data1 containsObject:@"BF"]);
    XCTAssertTrue([data1 containsObject:@"CD"]);
    XCTAssertTrue([data1 containsObject:@"CE"]);
    XCTAssertTrue([data1 containsObject:@"CF"]);
}

@end
