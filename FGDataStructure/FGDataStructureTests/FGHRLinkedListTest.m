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
    FGHRLinkedList *list = [self createListWithArray:@[@10, @6, @2, @5]];
    
    NSString *expectedResult = @"10\n6\n2\n5";
    XCTAssertTrue([[list values] isEqualToString:expectedResult]);
}

- (void)testInsertToTail {
    FGHRLinkedList *list = [self createListWithArray:@[@10, @6, @2, @5]];
    
    [list insertToTail:8];
    
    NSString *expectedResult = @"10\n6\n2\n5\n8";
    XCTAssertTrue([[list values] isEqualToString:expectedResult]);
}

- (void)testInsertToHead {
    FGHRLinkedList *list = [self createListWithArray:@[@10, @6, @2, @5]];
    
    [list insertToHead:8];
    
    NSString *expectedResult = @"8\n10\n6\n2\n5";
    XCTAssertTrue([[list values] isEqualToString:expectedResult]);
}

- (void)testInsertInPosition {
    FGHRLinkedList *list = [self createListWithArray:@[@10, @6, @2, @5]];
    
    [list insert:8 toPosition:0];
    
    NSString *expectedResult = @"8\n10\n6\n2\n5";
    XCTAssertTrue([[list values] isEqualToString:expectedResult]);
    
    [list insert:8 toPosition:2];
    
    NSString *expectedResult2 = @"8\n10\n8\n6\n2\n5";
    XCTAssertTrue([[list values] isEqualToString:expectedResult2]);
}

- (void)testDeleteInPosition {
    FGHRLinkedList *list = [self createListWithArray:@[@10, @6, @2, @5]];
    
    [list deleteInPosition:0];
    
    NSString *expectedResult = @"6\n2\n5";
    XCTAssertTrue([[list values] isEqualToString:expectedResult]);
    
    [list deleteInPosition:2];
    
    NSString *expectedResult2 = @"6\n2";
    XCTAssertTrue([[list values] isEqualToString:expectedResult2]);
}

- (void)testReverse {
    FGHRLinkedList *list = [self createListWithArray:@[@10, @6, @2, @5]];
    
    NSString *expectedResult = @"5\n2\n6\n10";
    XCTAssertTrue([[list reversedValues] isEqualToString:expectedResult]);
}

- (void)testComparsion {
    FGHRLinkedList *list1A = [self createListWithArray:@[@1, @2, @3, @4]];
    FGHRLinkedListNode *list1B = [self createNodeWithArray:@[@1, @2, @3, @4]];
    
    XCTAssertTrue([list1A isEqualToHead:list1B]);
    
    FGHRLinkedList *list2A = [self createListWithArray:@[@1, @2, @3]];
    FGHRLinkedListNode *list2B = [self createNodeWithArray:@[@1, @2, @3, @4]];
    
    XCTAssertFalse([list2A isEqualToHead:list2B]);
    
    FGHRLinkedList *list3A = [self createListWithArray:@[@12]];
    FGHRLinkedListNode *list3B = [self createNodeWithArray:@[@13]];
    
    XCTAssertFalse([list3A isEqualToHead:list3B]);
    
    FGHRLinkedList *list4A = [self createListWithArray:@[@4, @15]];
    FGHRLinkedListNode *list4B = [self createNodeWithArray:@[@15, @4]];
    
    XCTAssertFalse([list4A isEqualToHead:list4B]);
}

- (void)testSortedMerge {
    FGHRLinkedList *list1A = [self createListWithArray:@[@1, @3, @5, @6]];
    FGHRLinkedListNode *list1B = [self createNodeWithArray:@[@2, @4, @7]];
    
    [list1A mergeSortedWithSortedHead:list1B];
    
    XCTAssertTrue([[list1A values] isEqualToString:@"1\n2\n3\n4\n5\n6\n7"]);
    
    FGHRLinkedList *list2A = [self createListWithArray:@[@15]];
    FGHRLinkedListNode *list2B = [self createNodeWithArray:@[@12]];
    
    [list2A mergeSortedWithSortedHead:list2B];
    
    XCTAssertTrue([[list2A values] isEqualToString:@"12\n15"]);
    
    FGHRLinkedList *list3A = [self createListWithArray:@[]];
    FGHRLinkedListNode *list3B = [self createNodeWithArray:@[@1, @2]];
    
    [list3A mergeSortedWithSortedHead:list3B];
    
    XCTAssertTrue([[list3A values] isEqualToString:@"1\n2"]);
}

- (void)testNodeValueFromPositionFromTail {
    FGHRLinkedList *list1A = [self createListWithArray:@[@2, @1, @3, @5, @6]];
    XCTAssertTrue([list1A nodeValueFromPositionFromTail:3] == 1);
    
    FGHRLinkedList *list2A = [self createListWithArray:@[@2, @1, @4, @6, @8, @9, @0]];
    XCTAssertTrue([list2A nodeValueFromPositionFromTail:0] == 0);
    
    FGHRLinkedList *list3A = [self createListWithArray:@[@1, @2, @3]];
    XCTAssertTrue([list3A nodeValueFromPositionFromTail:2] == 1);
}

- (void)testRemoveDuplicates {
    FGHRLinkedList *list1 = [self createListWithArray:@[@1, @1, @3, @3, @5, @6]];
    [list1 removeDuplicates];
    NSString *expectedResult1 = @"1\n3\n5\n6";
    XCTAssertTrue([[list1 values] isEqualToString:expectedResult1]);
}

- (void)testHasCycle {
    FGHRLinkedList *list1 = [self createListWithArray:@[@1, @3, @5, @6]];
    XCTAssertFalse([list1 hasCycle]);
    
    FGHRLinkedListNode *node3 = [[FGHRLinkedListNode alloc] initWithData:5 next:nil];
    FGHRLinkedListNode *node2 = [[FGHRLinkedListNode alloc] initWithData:3 next:node3];
    FGHRLinkedListNode *node1 = [[FGHRLinkedListNode alloc] initWithData:1 next:node2];
    
    FGHRLinkedListNode *node = [[FGHRLinkedListNode alloc] initWithData:10 next:node1];
    
    node3.next = node1;
    
    FGHRLinkedList *list2 = [[FGHRLinkedList alloc] initWithHead:node];
    XCTAssertTrue([list2 hasCycle]);
}

- (void)testFindMergeNode {
    FGHRLinkedList *list1 = [self createListWithArray:@[@1, @3, @5, @6]];
    FGHRLinkedListNode *list2 = [self createNodeWithArray:@[@2, @4, @6, @8, @9]];
    
    FGHRLinkedListNode *sharedNode = [self createNodeWithArray:@[@12, @15, @18]];
    list1.head.next.next.next.next = sharedNode;
    list2.next.next.next.next.next = sharedNode;
    
    FGHRLinkedListNode *node = [list1 findMergeNode:list2];
    
    XCTAssertTrue(node == sharedNode);
}

#pragma mark - Helper

- (FGHRLinkedList *)createListWithArray:(NSArray *)array {
    return [[FGHRLinkedList alloc] initWithHead:[self createNodeWithArray:array]];
}

- (FGHRLinkedListNode *)createNodeWithArray:(NSArray *)array {
    FGHRLinkedListNode *head;
    
    for (NSInteger i = array.count - 1; i >= 0; i--) {
        NSNumber *data = array[i];
        FGHRLinkedListNode *node = [[FGHRLinkedListNode alloc] initWithData:data.intValue next:head];
        head = node;
    }
    
    return head;
}

@end
