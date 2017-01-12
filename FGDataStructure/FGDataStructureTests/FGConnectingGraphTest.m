//
//  FGConnectingGraphTest.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 12/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGConnectingGraph.h"

@interface FGConnectingGraphTest : XCTestCase

@end

@implementation FGConnectingGraphTest

- (void)testExample {
    //Example
    //5 // n = 5
    //query(1, 2) return false
    //connect(1, 2)
    //query(1, 3) return false
    //connect(2, 4)
    //query(1, 4) return true
    
    FGConnectingGraph *connectingGraph = [[FGConnectingGraph alloc] initWithN:5];
    XCTAssert([connectingGraph query:1 with:2] == NO);
    [connectingGraph connect:1 with:2];
    XCTAssert([connectingGraph query:1 with:3] == NO);
    [connectingGraph connect:2 with:4];
    XCTAssert([connectingGraph query:1 with:4] == YES);
}
@end
