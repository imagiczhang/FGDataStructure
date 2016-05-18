//
//  FGAPPLEPopularObjectTest.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 18/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGAPPLEPopularObject.h"

@interface FGAPPLEPopularObjectTest : XCTestCase

@end

@implementation FGAPPLEPopularObjectTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPopularStringInArray {
    NSArray *data = @[@"one", @"two", @"three", @"two", @"three", @"five", @"two"];
    XCTAssertTrue([[FGAPPLEPopularObject popularStringInArray:data] isEqualToString:@"two"]);
}

@end
