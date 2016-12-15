//
//  FGFBTreeTraverseTest.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 10/12/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGFBTraverseTree.h"

@interface FGFBTreeTraverseTest : XCTestCase

@end

@implementation FGFBTreeTraverseTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInOrderTreeBuilder {
    FGFBInOrderTreeBuilder *builder = [[FGFBInOrderTreeBuilder alloc] init];
    FGFBTreeNode *root = [builder buildTreeWithInOrderSequence:@[@4, @5, @6, @9, @1, @3, @2]];
    XCTAssertTrue([root.value isEqualToNumber:@9]);
    XCTAssertTrue([root.left.value isEqualToNumber:@5]);
    XCTAssertTrue([root.left.left.value isEqualToNumber:@4]);
    XCTAssertTrue([root.left.right.value isEqualToNumber:@6]);
    XCTAssertTrue([root.right.value isEqualToNumber:@3]);
    XCTAssertTrue([root.right.left.value isEqualToNumber:@1]);
    XCTAssertTrue([root.right.right.value isEqualToNumber:@2]);
}

- (void)testTreeSerialize
{
    FGFBInOrderTreeBuilder *builder = [[FGFBInOrderTreeBuilder alloc] init];
    FGFBTreeNode *root = [builder buildTreeWithInOrderSequence:@[@4, @5, @6, @9, @1, @3, @2]];
    NSArray *expectation = @[@9, @5, @4, [NSNull null], [NSNull null], @6, [NSNull null], [NSNull null], @3, @1, [NSNull null], [NSNull null], @2, [NSNull null], [NSNull null]];
    XCTAssertTrue([[FGFBTreeSerializer serializeTree:root] isEqualToArray:expectation]);
}

- (void)testTreeDeserialize
{
    NSArray *input = @[@9, @5, @4, [NSNull null], [NSNull null], @6, [NSNull null], [NSNull null], @3, @1, [NSNull null], [NSNull null], @2, [NSNull null], [NSNull null]];
    FGFBTreeNode *root = [FGFBTreeSerializer deserializeFromArray:input];
    XCTAssertTrue([root.value isEqualToNumber:@9]);
    XCTAssertTrue([root.left.value isEqualToNumber:@5]);
    XCTAssertTrue([root.left.left.value isEqualToNumber:@4]);
    XCTAssertTrue([root.left.right.value isEqualToNumber:@6]);
    XCTAssertTrue([root.right.value isEqualToNumber:@3]);
    XCTAssertTrue([root.right.left.value isEqualToNumber:@1]);
    XCTAssertTrue([root.right.right.value isEqualToNumber:@2]);
}

@end
