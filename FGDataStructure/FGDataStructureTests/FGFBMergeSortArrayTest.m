//
//  FGFBMergeSortArrayTest.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 17/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGFBMergeSortArray.h"

@interface FGFBMergeSortArrayTest : XCTestCase

@end

@implementation FGFBMergeSortArrayTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMergedArrayFromArrays {
    XCTAssertTrue([[FGFBMergeSortArray mergedArrayFromArrays:[self data1]] isEqualToArray:[self dataResult1]]);
}

- (NSArray *)data1 {
    return @[
             @[@2, @5, @10],
             @[@25, @100, @105],
             @[@7, @42, @56]
             ];
}

- (NSArray *)dataResult1 {
    return @[@2, @5, @7, @10, @25, @42, @56, @100, @105];
}

@end
