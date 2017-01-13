//
//  FGWordSearchTest.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 13/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGWordSearch.h"

@interface FGWordSearchTest : XCTestCase

@end

@implementation FGWordSearchTest

- (void)testExample {
    
    NSArray *board = @[
                       @[@"A", @"B", @"C", @"E"],
                       @[@"S", @"F", @"C", @"S"],
                       @[@"A", @"D", @"E", @"E"]
                       ];
    
    XCTAssert([FGWordSearch isWord:@"ABCCED" existInBoard:board] == YES);
    XCTAssert([FGWordSearch isWord:@"ABCESEECFDAS" existInBoard:board] == YES);
    XCTAssert([FGWordSearch isWord:@"SEE" existInBoard:board] == YES);
    XCTAssert([FGWordSearch isWord:@"ABCB" existInBoard:board] == NO);
}

@end
