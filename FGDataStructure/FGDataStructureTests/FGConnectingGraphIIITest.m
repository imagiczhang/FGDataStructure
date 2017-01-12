//
//  FGConnectingGraphIIITest.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 12/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGConnectingGraphIII.h"

@interface FGConnectingGraphIIITest : XCTestCase

@end

@implementation FGConnectingGraphIIITest

- (void)testExample {
    FGConnectingGraphIII *connectingGraph = [[FGConnectingGraphIII alloc] initWithN:5];
    XCTAssert([connectingGraph query] == 5);
    [connectingGraph connect:1 with:2];
    XCTAssert([connectingGraph query] == 4);
    [connectingGraph connect:2 with:4];
    XCTAssert([connectingGraph query] == 3);
    [connectingGraph connect:1 with:4];
    XCTAssert([connectingGraph query] == 3);
}

@end
