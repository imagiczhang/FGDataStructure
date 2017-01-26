//
//  FGHeapifyTest.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 24/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGHeapify.h"

@interface FGHeapifyTest : XCTestCase

@end

@implementation FGHeapifyTest

- (void)testExample {
    NSArray<NSNumber *> *heap = [FGHeapify heapifyArray:@[@3,@2,@1,@4,@5]];
    
    NSInteger i = 0;
    while (2 * i + 1 < heap.count) {
        XCTAssert(heap[i] < heap[2 * i + 1]);
        if (2 * i + 2 < heap.count) {
            XCTAssert(heap[i] < heap[2 * i + 2]);
        }
        i++;
    }
}

@end
