//
//  FGHashTableTest.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 26/04/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGHashTable.h"

@interface FGHashTableTest : XCTestCase

@end

@implementation FGHashTableTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testHashTable {
    FGHashTable *hashTable = [[FGHashTable alloc] initWithSize:1001];
    [hashTable setObject:@"Hello 1" forKey:@"Test1"];
    [hashTable setObject:@"Hello 2" forKey:@"Test2"];
    [hashTable setObject:@"Hello 3" forKey:@"Test3"];
    [hashTable setObject:@"Hello 4" forKey:@"Test4"];
    [hashTable setObject:@"Hello 5" forKey:@"Test5"];
    [hashTable setObject:@"Hello 6" forKey:@"Test6"];
    [hashTable setObject:@"Hello 7" forKey:@"Test7"];
    [hashTable setObject:@"Hello 8" forKey:@"Test8"];
    
    XCTAssertEqual([hashTable objectForKey:@"Test1"], @"Hello 1");
    XCTAssertEqual([hashTable objectForKey:@"Test2"], @"Hello 2");
    XCTAssertEqual([hashTable objectForKey:@"Test3"], @"Hello 3");
    XCTAssertEqual([hashTable objectForKey:@"Test4"], @"Hello 4");
    XCTAssertEqual([hashTable objectForKey:@"Test5"], @"Hello 5");
    XCTAssertEqual([hashTable objectForKey:@"Test6"], @"Hello 6");
    XCTAssertEqual([hashTable objectForKey:@"Test7"], @"Hello 7");
    XCTAssertEqual([hashTable objectForKey:@"Test8"], @"Hello 8");
    
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
