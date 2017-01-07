//
//  FGFBClosestPointsTest.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 15/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FGFBClosestPoints.h"

@interface FGFBClosestPointsTest : XCTestCase

@property (nonatomic, strong) FGFBPoint *point1;
@property (nonatomic, strong) FGFBPoint *point2;
@property (nonatomic, strong) FGFBPoint *point3;
@property (nonatomic, strong) FGFBPoint *point4;
@property (nonatomic, strong) FGFBPoint *point5;
@property (nonatomic, strong) FGFBPoint *point6;
@property (nonatomic, strong) FGFBPoint *point7;

@end

@implementation FGFBClosestPointsTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testData1 {
    NSArray<FGFBPoint *> *data1 = [self data1];
    NSArray<FGFBPoint *> *data1Result = [FGFBClosestPoints closestPointsWith2DPoints:data1 forK:2 type:FGFBClosestPointsCalculatorTypeSort];
    XCTAssertTrue([data1Result containsObject:self.point1]);
    XCTAssertTrue([data1Result containsObject:self.point4]);
    
    NSArray<FGFBPoint *> *data1RecursiveResult = [FGFBClosestPoints closestPointsWith2DPoints:data1 forK:2 type:FGFBClosestPointsCalculatorTypeRecursive];
    XCTAssertTrue([data1RecursiveResult containsObject:self.point1]);
    XCTAssertTrue([data1RecursiveResult containsObject:self.point4]);
    
    NSArray<FGFBPoint *> *data1QuickSortResult = [FGFBClosestPoints closestPointsWith2DPoints:data1 forK:2 type:FGFBClosestPointsCalculatorTypeRecursive];
    XCTAssertTrue([data1QuickSortResult containsObject:self.point1]);
    XCTAssertTrue([data1QuickSortResult containsObject:self.point4]);
    
}

#pragma mark - data 
- (NSArray<FGFBPoint *> *)data1 {
    if (!self.point1) self.point1 = [[FGFBPoint alloc] initWithPointX:1 pointY:3];
    if (!self.point2) self.point2 = [[FGFBPoint alloc] initWithPointX:2 pointY:5];
    if (!self.point3) self.point3 = [[FGFBPoint alloc] initWithPointX:9 pointY:3];
    if (!self.point4) self.point4 = [[FGFBPoint alloc] initWithPointX:5 pointY:1];
    if (!self.point5) self.point5 = [[FGFBPoint alloc] initWithPointX:10 pointY:23];
    if (!self.point6) self.point6 = [[FGFBPoint alloc] initWithPointX:9 pointY:10];
    if (!self.point7) self.point7 = [[FGFBPoint alloc] initWithPointX:102 pointY:41];
    
    return @[self.point1, self.point2, self.point3, self.point4, self.point5, self.point6, self.point7];
}


@end
