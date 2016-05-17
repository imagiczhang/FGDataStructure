//
//  FGGGNumberGroupTest.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 16/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGGGNumberGroup.h"

@interface FGGGNumberGroupTest : XCTestCase

@end

@implementation FGGGNumberGroupTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNumberGroupFromNumbers {
    NSArray *data1 = @[@1, @2, @3, @10, @25, @26, @30, @31, @32, @33];
    NSArray *expectResult1 = @[@[@1,@2,@3], @[@10], @[@25, @26], @[@30, @31, @32, @33]];
    
    XCTAssertTrue([[FGGGNumberGroup numberGroupFromNumbers:data1] isEqualToArray:expectResult1]);
    
    NSArray *data2 = @[@1, @2, @3, @10, @25, @26, @30, @31, @32, @33, @40];
    NSArray *expectResult2 = @[@[@1,@2,@3], @[@10], @[@25, @26], @[@30, @31, @32, @33], @[@40]];
    
    XCTAssertTrue([[FGGGNumberGroup numberGroupFromNumbers:data2] isEqualToArray:expectResult2]);
}


@end
