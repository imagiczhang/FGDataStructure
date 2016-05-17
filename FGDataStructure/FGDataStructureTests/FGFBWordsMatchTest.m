//
//  FBFBWordsMatchTest.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 17/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGFBWordsMatch.h"

@interface FGFBWordsMatchDataSet : NSObject

@property (nonatomic, copy) NSArray *data;
@property (nonatomic, copy) NSString *pattern;

@end

@implementation FGFBWordsMatchDataSet

@end

@interface FGFBWordsMatchTest : XCTestCase

@end

@implementation FGFBWordsMatchTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFilterWordsByRegexFromArray {
    FGFBWordsMatchDataSet *data = [self data1];
    NSArray *filterArray = [FGFBWordsMatch filterWordsByRegexFromArray:data.data withPattern:data.pattern];
    
    XCTAssertTrue(filterArray.count == 3);
    XCTAssertTrue([filterArray containsObject:@"cat"]);
    XCTAssertTrue([filterArray containsObject:@"cut"]);
    XCTAssertTrue([filterArray containsObject:@"cot"]);
}

- (void)testFilterWordsByPredicateFromArray {
    FGFBWordsMatchDataSet *data = [self data1];
    NSArray *filterArray = [FGFBWordsMatch filterWordsByPredicateFromArray:data.data withPattern:data.pattern];
    
    XCTAssertTrue(filterArray.count == 3);
    XCTAssertTrue([filterArray containsObject:@"cat"]);
    XCTAssertTrue([filterArray containsObject:@"cut"]);
    XCTAssertTrue([filterArray containsObject:@"cot"]);
}

- (FGFBWordsMatchDataSet *)data1 {
    FGFBWordsMatchDataSet *data = [FGFBWordsMatchDataSet new];
    data.data = @[@"cat", @"dog", @"cut", @"cot", @"cop", @"coop"];
    data.pattern = @"c.t";
    
    return data;
}

@end

