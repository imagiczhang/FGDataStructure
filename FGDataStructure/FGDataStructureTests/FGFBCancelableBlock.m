//
//  FGFBCancelableBlock.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 23/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#include "FGFBCancelableBlock.h"
#include "FGFBCancelableBlock2.h"

@interface FGFBCancelableBlock : XCTestCase

@end

@implementation FGFBCancelableBlock

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCancelableBlockWithCancel {
    __block BOOL isExecuted = NO;
    XCTestExpectation *expectation = [self expectationWithDescription:@"executed expectation"];

    dispatch_queue_t testQueue = dispatch_queue_create("TestQueue1", NULL);

    dispatch_after_with_cancel_t block = dispatch_after_with_cancel(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), testQueue, ^{
        isExecuted = YES;
    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), testQueue, ^{
        cancel_block(block);
    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), testQueue, ^{
        XCTAssertFalse(isExecuted);
        [expectation fulfill];
    });

    [self waitForExpectationsWithTimeout:0.4 handler:nil];
}

- (void)testCancelableBlockWithNonCancel {
    __block BOOL isExecuted = NO;
    XCTestExpectation *expectation = [self expectationWithDescription:@"executed expectation"];

    dispatch_queue_t testQueue = dispatch_queue_create("TestQueue2", NULL);

    dispatch_after_with_cancel(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), testQueue, ^{
        isExecuted = YES;
    });

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), testQueue, ^{
        XCTAssertTrue(isExecuted);
        [expectation fulfill];
    });

    [self waitForExpectationsWithTimeout:0.3 handler:nil];
}

- (void)testCancelableBlockWithCancel2 {
    __block BOOL isExecuted = NO;
    XCTestExpectation *expectation = [self expectationWithDescription:@"executed expectation"];
    
    dispatch_queue_t testQueue = dispatch_queue_create("TestQueue3", NULL);
    
    BOOL shouldCancel = NO;
    dispatch_after_with_cancel_2(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), testQueue, ^{
        isExecuted = YES;
    }, &shouldCancel);

    shouldCancel = YES;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), testQueue, ^{
        XCTAssertFalse(isExecuted);
        [expectation fulfill];
    });
    
    [self waitForExpectationsWithTimeout:0.6 handler:nil];
}

- (void)testCancelableBlockWithNonCancel2 {
    __block BOOL isExecuted = NO;
    XCTestExpectation *expectation = [self expectationWithDescription:@"executed expectation"];
    
    dispatch_queue_t testQueue = dispatch_queue_create("TestQueue4", NULL);
    
    __block BOOL shouldCancel = NO;
    dispatch_after_with_cancel_2(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), testQueue, ^{
        isExecuted = YES;
    }, &shouldCancel);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), testQueue, ^{
        XCTAssertTrue(isExecuted);
        [expectation fulfill];
    });
    
    [self waitForExpectationsWithTimeout:0.6 handler:nil];
}


@end
