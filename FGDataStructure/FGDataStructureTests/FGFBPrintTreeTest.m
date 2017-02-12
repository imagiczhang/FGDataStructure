//
//  FGFBPrintTreeTest.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 12/02/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGFBPrintTree.h"

@interface FGFBPrintTreeTest : XCTestCase

@end

@implementation FGFBPrintTreeTest

- (void)testPrintTree {
    FGFBPrintTreeNode *root = [[FGFBPrintTreeNode alloc] initWithValue:@"A"];
    root.left = [[FGFBPrintTreeNode alloc] initWithValue:@"B"];
    root.right = [[FGFBPrintTreeNode alloc] initWithValue:@"C"];
    root.left.left = [[FGFBPrintTreeNode alloc] initWithValue:@"D"];
    root.left.right = [[FGFBPrintTreeNode alloc] initWithValue:@"E"];
    root.right.left = [[FGFBPrintTreeNode alloc] initWithValue:@"F"];
    root.right.right = [[FGFBPrintTreeNode alloc] initWithValue:@"G"];
    
    NSArray<NSString *> *result = [FGFBPrintTree printOutTree:root];
    XCTAssert(result.count == 3);
    XCTAssert([result[0] isEqualToString:@"A"]);
    XCTAssert([result[1] isEqualToString:@"BC"]);
    XCTAssert([result[2] isEqualToString:@"DEFG"]);
}

@end
