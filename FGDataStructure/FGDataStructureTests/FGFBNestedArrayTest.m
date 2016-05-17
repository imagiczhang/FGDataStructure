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
    FGFBNestedArray *nestedArray1 = [[FGFBNestedArray alloc] initWithNestedArray:data type:FGFBNestedArrayComplexityTypeSlow];
    
    XCTAssertTrue([[nestedArray1 nextObject] isEqualToString:@"a"]);
    XCTAssertTrue([[nestedArray1 nextObject] isEqualToString:@"b"]);
    XCTAssertTrue([[nestedArray1 nextObject] isEqualToString:@"c"]);
    XCTAssertTrue([[nestedArray1 nextObject] isEqualToString:@"d"]);
    XCTAssertTrue([[nestedArray1 nextObject] isEqualToString:@"e"]);
    XCTAssertTrue([[nestedArray1 nextObject] isEqualToString:@"f"]);
    
    FGFBNestedArray *nestedArray2 = [[FGFBNestedArray alloc] initWithNestedArray:data type:FGFBNestedArrayComplexityTypeQuick];
    XCTAssertTrue([[nestedArray2 nextObject] isEqualToString:@"a"]);
    XCTAssertTrue([[nestedArray2 nextObject] isEqualToString:@"b"]);
    XCTAssertTrue([[nestedArray2 nextObject] isEqualToString:@"c"]);
    XCTAssertTrue([[nestedArray2 nextObject] isEqualToString:@"d"]);
    XCTAssertTrue([[nestedArray2 nextObject] isEqualToString:@"e"]);
//    XCTAssertTrue([[nestedArray2 nextObject] isEqualToString:@"f"]);
    
}


@end
