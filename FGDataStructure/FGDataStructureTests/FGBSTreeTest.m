//
//  FGBSTreeTest.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 19/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGBSTree.h"
#import "FGBSTreeNode.h"
#import "FGBSTreeObject.h"

@interface FGBSTreeTest : XCTestCase

@end

@implementation FGBSTreeTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testTree {
    FGBSTree *tree = [self data1];
//    tree.root.ob
}

/**
 *      20
 *     /  \
 *   10    30
 *  /  \
 * 5    40
 *
 */
- (FGBSTree *)data1 {
    FGBSTreeObject *object40 = [[FGBSTreeObject alloc] initWithNumber:@40];
    FGBSTreeObject *object30 = [[FGBSTreeObject alloc] initWithNumber:@30];
    FGBSTreeObject *object20 = [[FGBSTreeObject alloc] initWithNumber:@20];
    FGBSTreeObject *object10 = [[FGBSTreeObject alloc] initWithNumber:@10];
    FGBSTreeObject *object5 = [[FGBSTreeObject alloc] initWithNumber:@5];

    FGBSTree *tree = [[FGBSTree alloc] initWithCompareSelector:@selector(compare:)];
    [tree addObject:object20];
    [tree addObject:object10];
    [tree addObject:object30];
    [tree addObject:object5];
    [tree addObject:object40];
    
    return tree;
}


@end
