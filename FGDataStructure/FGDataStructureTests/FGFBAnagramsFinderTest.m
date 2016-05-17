//
//  FGFBAnagramsFinderTest.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 17/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGFBAnagramsFinder.h"

@interface FGFBAnagramsFinderTest : XCTestCase

@end

@implementation FGFBAnagramsFinderTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testHasAnagramsByUsingSortFromArray {
    XCTAssertTrue([FGFBAnagramsFinder hasAnagramsByUsingSortFromArray:[self data1]]);
    XCTAssertFalse([FGFBAnagramsFinder hasAnagramsByUsingSortFromArray:[self data2]]);
}

- (NSArray *)data1 {
    return @[@"bag", @"bat", @"tab"];
}

- (NSArray *)data2 {
    return @[@"gab", @"bat", @"laf"];
}

@end
