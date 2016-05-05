//
//  FGHR2DArrayDSTest.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 5/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGHR2DArrayDS.h"

@interface FGHR2DArrayDSTest : XCTestCase

@end

@implementation FGHR2DArrayDSTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testResultPositive {
    FGHR2DArrayDSModel *row1 = [[FGHR2DArrayDSModel alloc] initWithArray:@[@1, @1, @1, @0, @0, @0]];
    FGHR2DArrayDSModel *row2 = [[FGHR2DArrayDSModel alloc] initWithArray:@[@0, @1, @0, @0, @0, @0]];
    FGHR2DArrayDSModel *row3 = [[FGHR2DArrayDSModel alloc] initWithArray:@[@1, @1, @1, @0, @0, @0]];
    FGHR2DArrayDSModel *row4 = [[FGHR2DArrayDSModel alloc] initWithArray:@[@0, @0, @2, @4, @4, @0]];
    FGHR2DArrayDSModel *row5 = [[FGHR2DArrayDSModel alloc] initWithArray:@[@0, @0, @0, @2, @0, @0]];
    FGHR2DArrayDSModel *row6 = [[FGHR2DArrayDSModel alloc] initWithArray:@[@0, @0, @1, @2, @4, @0]];
    
    NSArray<FGHR2DArrayDSModel *> *rows = @[row1, row2, row3, row4, row5, row6];
    
    XCTAssertTrue([FGHR2DArrayDS resultFromArray:rows] == 19);
}

- (void)testResultNegative {
    FGHR2DArrayDSModel *row1 = [[FGHR2DArrayDSModel alloc] initWithArray:@[@0, @-4, @-6, @0, @-7, @-6]];
    FGHR2DArrayDSModel *row2 = [[FGHR2DArrayDSModel alloc] initWithArray:@[@-1, @-2, @-6, @-8, @-3, @-1]];
    FGHR2DArrayDSModel *row3 = [[FGHR2DArrayDSModel alloc] initWithArray:@[@-8, @-4, @-2, @-8, @-8, @-6]];
    FGHR2DArrayDSModel *row4 = [[FGHR2DArrayDSModel alloc] initWithArray:@[@-3, @-1, @-2, @-5, @-7, @-4]];
    FGHR2DArrayDSModel *row5 = [[FGHR2DArrayDSModel alloc] initWithArray:@[@-3, @-5, @-3, @-6, @-6, @-6]];
    FGHR2DArrayDSModel *row6 = [[FGHR2DArrayDSModel alloc] initWithArray:@[@-3, @-6, @0, @-8, @-6, @-7]];
    
    NSArray<FGHR2DArrayDSModel *> *rows = @[row1, row2, row3, row4, row5, row6];
    
    XCTAssertTrue([FGHR2DArrayDS resultFromArray:rows] == -19);
}

@end
