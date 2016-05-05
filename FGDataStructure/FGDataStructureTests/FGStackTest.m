//
//  FGStackTest.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 27/04/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGStack.h"

@interface FGStack (Testing)

@property (nonatomic, strong) NSMutableArray<NSObject *> *stackArray;

@end

@interface FGStackTest : XCTestCase

@end

@implementation FGStackTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPush {
    NSString *stringOne = @"StringOne";
    NSString *stringTwo = @"StringTwo";
    NSString *stringThree = @"StringThree";
    NSString *stringFour = @"StringFour";
    NSString *stringFive = @"StringFive";
    NSString *stringSix = @"StringSix";
    
    FGStack *stack = [[FGStack alloc] initWithCapacity:5];
    [stack push:stringOne];
    [stack push:stringTwo];
    [stack push:stringThree];
    [stack push:stringFour];
    [stack push:stringFive];
    
    XCTAssertEqual(stack.stackArray.count, 5);
    
    [stack push:stringSix];
    
    XCTAssertEqual(stack.stackArray.count, 5);
}

- (void)testTop {
    NSString *stringOne = @"StringOne";
    NSString *stringTwo = @"StringTwo";
    NSString *stringThree = @"StringThree";
    NSString *stringFour = @"StringFour";
    NSString *stringFive = @"StringFive";
    
    FGStack *stack = [[FGStack alloc] initWithCapacity:5];
    [stack push:stringOne];
    [stack push:stringTwo];
    [stack push:stringThree];
    [stack push:stringFour];
    [stack push:stringFive];
    
    XCTAssertEqual([stack top], stringFive);
}

- (void)testPop {
    NSString *stringOne = @"StringOne";
    NSString *stringTwo = @"StringTwo";
    NSString *stringThree = @"StringThree";
    NSString *stringFour = @"StringFour";
    NSString *stringFive = @"StringFive";
    
    FGStack *stack = [[FGStack alloc] initWithCapacity:5];
    [stack push:stringOne];
    [stack push:stringTwo];
    [stack push:stringThree];
    [stack push:stringFour];
    [stack push:stringFive];
    
    XCTAssertEqual([stack top], stringFive);
    XCTAssertEqual(stack.stackArray.count, 5);
    
    [stack pop];
    
    XCTAssertEqual([stack top], stringFour);
    XCTAssertEqual(stack.stackArray.count, 4);
}

- (void)testIsEmpty {
    FGStack *stack = [[FGStack alloc] initWithCapacity:5];
    XCTAssertTrue([stack isEmpty]);
    
    NSString *stringOne = @"StringOne";
    [stack push:stringOne];
    
    XCTAssertFalse([stack isEmpty]);
    
    [stack pop];
    XCTAssertTrue([stack isEmpty]);
}

- (void)testIsFull {
    NSString *stringOne = @"StringOne";
    NSString *stringTwo = @"StringTwo";
    NSString *stringThree = @"StringThree";
    NSString *stringFour = @"StringFour";
    NSString *stringFive = @"StringFive";
    
    FGStack *stack = [[FGStack alloc] initWithCapacity:5];
    [stack push:stringOne];
    [stack push:stringTwo];
    [stack push:stringThree];
    [stack push:stringFour];
    [stack push:stringFive];
    
    XCTAssertTrue([stack isFull]);
    
    [stack pop];
    
    XCTAssertFalse([stack isFull]);
}

- (void)testSize {
    NSString *stringOne = @"StringOne";
    NSString *stringTwo = @"StringTwo";
    NSString *stringThree = @"StringThree";
    NSString *stringFour = @"StringFour";
    
    FGStack *stack = [[FGStack alloc] initWithCapacity:5];
    [stack push:stringOne];
    [stack push:stringTwo];
    [stack push:stringThree];
    [stack push:stringFour];
    
    XCTAssertEqual([stack size], 4);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
