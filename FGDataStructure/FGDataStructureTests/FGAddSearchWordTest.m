//
//  FGAddSearchWordTest.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 13/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGAddSearchWord.h"

@interface FGAddSearchWordTest : XCTestCase

@end

@implementation FGAddSearchWordTest
- (void)testExample {
    FGAddSearchWord *solution = [[FGAddSearchWord alloc] init];
    [solution addWord:@"bad"];
    [solution addWord:@"dad"];
    [solution addWord:@"mad"];
    
    XCTAssert([solution searchWord:@"pad"] == NO);
    XCTAssert([solution searchWord:@"bad"] == YES);
    XCTAssert([solution searchWord:@".ad"] == YES);
    XCTAssert([solution searchWord:@"b.."] == YES);
    XCTAssert([solution searchWord:@"b..."] == NO);
    XCTAssert([solution searchWord:@"...."] == NO);
    XCTAssert([solution searchWord:@"..."] == YES);
}

@end
