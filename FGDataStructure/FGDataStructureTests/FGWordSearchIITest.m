//
//  FGWordSearchIITest.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 14/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGWordSearchII.h"

@interface FGWordSearchIITest : XCTestCase

@end

@implementation FGWordSearchIITest

- (void)testExample {
    //Example
    //Given matrix:
    //doaf
    //agai
    //dcan
    //and dictionary:
    //{"dog", "dad", "dgdg", "can", "again"}
    //
    //return {"dog", "dad", "can", "again"}
    
    NSArray *board = @[
                       @[@"d", @"o", @"a", @"f"],
                       @[@"a", @"g", @"a", @"i"],
                       @[@"d", @"c", @"a", @"n"]
                       ];
    
    FGWordSearchII *solution = [[FGWordSearchII alloc] initWithWords:@[@"dog", @"dad", @"dgdg", @"can", @"again"]];
    NSArray<NSString *> *result = [solution wordsInBoard:board];
    NSSet<NSString *> *resultSet = [NSSet setWithArray:result];
    XCTAssert(result.count == 4);
    XCTAssert([resultSet containsObject:@"dog"]);
    XCTAssert([resultSet containsObject:@"dad"]);
    XCTAssert([resultSet containsObject:@"can"]);
    XCTAssert([resultSet containsObject:@"again"]);
}

@end
