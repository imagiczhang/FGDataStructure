//
//  FGFBNestedArrayTest.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 16/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGFBNestedArray.h"

@interface FGFBNestedArrayTest : XCTestCase

@end

@implementation FGFBNestedArrayTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNextObject {
    NSArray *data = @[@"a", @[@"b", @"c"], @[@[@"d", @"e"], @"f"]];
    FGFBNestedArray *nestedArray = [[FGFBNestedArray alloc] initWithNestedArray:data];
    
    XCTAssertTrue([[nestedArray nextObject] isEqualToString:@"a"]);
    XCTAssertTrue([[nestedArray nextObject] isEqualToString:@"b"]);
    XCTAssertTrue([[nestedArray nextObject] isEqualToString:@"c"]);
    XCTAssertTrue([[nestedArray nextObject] isEqualToString:@"d"]);
    XCTAssertTrue([[nestedArray nextObject] isEqualToString:@"e"]);
    XCTAssertTrue([[nestedArray nextObject] isEqualToString:@"f"]);
}


@end
