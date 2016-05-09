//
//  FGHRTreeTest.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 10/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGHRTree.h"

@interface FGHRTreeTest : XCTestCase

@end

@implementation FGHRTreeTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPreOrder {
    FGHRTreeNode *node = [self data1];
    FGHRTree *tree = [[FGHRTree alloc] initWithTreeNode:node];
    
    XCTAssertTrue([[tree printPreOrder] isEqualToString:@"3 5 1 4 2 6"]);
}

- (void)testPostOrder {
    FGHRTreeNode *node = [self data1];
    FGHRTree *tree = [[FGHRTree alloc] initWithTreeNode:node];
    
    XCTAssertTrue([[tree printPostOrder] isEqualToString:@"1 4 5 6 2 3"]);
}

- (void)testInOrder {
    FGHRTreeNode *node = [self data1];
    FGHRTree *tree = [[FGHRTree alloc] initWithTreeNode:node];
    
    XCTAssertTrue([[tree printInOrder] isEqualToString:@"1 5 4 3 6 2"]);
}


#pragma mark - data

/**
 *          3
 *         / \
 *        5   2
 *       / \ /
 *      1  4 6
 *
 *  @return `FGHRTreeNode` tree data 1
 */
- (FGHRTreeNode *)data1 {
    FGHRTreeNode *node1 = [[FGHRTreeNode alloc] initWitData:1 left:nil right:nil];
    FGHRTreeNode *node2 = [[FGHRTreeNode alloc] initWitData:4 left:nil right:nil];
    FGHRTreeNode *node3 = [[FGHRTreeNode alloc] initWitData:5 left:node1 right:node2];
    
    FGHRTreeNode *node4 = [[FGHRTreeNode alloc] initWitData:6 left:nil right:nil];
    FGHRTreeNode *node5 = [[FGHRTreeNode alloc] initWitData:2 left:node4 right:nil];
    
    FGHRTreeNode *node6 = [[FGHRTreeNode alloc] initWitData:3 left:node3 right:node5];
    
    return node6;
}

@end
