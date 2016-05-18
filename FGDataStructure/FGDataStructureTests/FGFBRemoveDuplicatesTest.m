//
//  FGFBRemoveDuplicatesTest.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 18/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGFBRemoveDuplicates.h"

@interface FGFBRemoveDuplicatesTest : XCTestCase

@end

@implementation FGFBRemoveDuplicatesTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testRemoveDuplicatesByUsingSetFrom {
    NSArray *result = [FGFBRemoveDuplicates removeDuplicatesByUsingSetFrom:[self data1]];
    XCTAssertTrue([result isEqualToArray:[self expectedData1]]);
}

- (NSArray *)data1 {
    return @[@2, @1, @3, @1, @2];
}

- (NSArray *)expectedData1 {
    return @[@2, @1, @3];
}

@end
