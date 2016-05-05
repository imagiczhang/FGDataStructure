//
//  FGHRLinkedListTest.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 5/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGHRLinkedList.h"

@interface FGHRLinkedListTest : XCTestCase

@end

@implementation FGHRLinkedListTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testResult {
    FGHRLinkedListNode *node3 = [[FGHRLinkedListNode alloc] initWithData:5 next:nil];
    FGHRLinkedListNode *node2 = [[FGHRLinkedListNode alloc] initWithData:2 next:node3];
    FGHRLinkedListNode *node1 = [[FGHRLinkedListNode alloc] initWithData:6 next:node2];
    
    FGHRLinkedListNode *head = [[FGHRLinkedListNode alloc] initWithData:10 next:node1];
    
    FGHRLinkedList *list = [[FGHRLinkedList alloc] initWithHead:head];
    
    NSString *expectedResult = @"10\n6\n2\n5";
    XCTAssertTrue([[list values] isEqualToString:expectedResult]);
}



@end
