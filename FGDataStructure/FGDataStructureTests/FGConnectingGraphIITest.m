//
//  FGConnectingGraphIITest.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 12/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGConnectingGraphII.h"

@interface FGConnectingGraphIITest : XCTestCase

@end

@implementation FGConnectingGraphIITest

- (void)testExample {
    FGConnectingGraphII *connectingGraph = [[FGConnectingGraphII alloc] initWithN:5];
    XCTAssert([connectingGraph query:1] == 1);
    [connectingGraph connect:1 with:2];
    XCTAssert([connectingGraph query:1] == 2);
    [connectingGraph connect:2 with:4];
    XCTAssert([connectingGraph query:1] == 3);
    [connectingGraph connect:1 with:4];
    XCTAssert([connectingGraph query:1] == 3);
}

@end
