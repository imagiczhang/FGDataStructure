//
//  FGFBFindCloneViewTest.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 14/12/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <UIKit/UIKit.h>
#import "FGFBFindCloneView.h"

@interface FGFBFindCloneViewTest : XCTestCase

@end

@implementation FGFBFindCloneViewTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFindCloneView {
    UIView *viewA = [UIView new];
    UIView *subview1 = [UIView new];
    [viewA addSubview:subview1];
    UIView *subview2 = [UIView new];
    [viewA addSubview:subview2];
    UIView *subview3 = [UIView new];
    [subview1 addSubview:subview3];
    UIView *subview4 = [UIView new];
    [subview1 addSubview:subview4];
    
    UIView *viewB = [UIView new];
    UIView *subview5 = [UIView new];
    [viewB addSubview:subview5];
    UIView *subview6 = [UIView new];
    [viewB addSubview:subview6];
    UIView *subview7 = [UIView new];
    [subview5 addSubview:subview7];
    UIView *subview8 = [UIView new];
    [subview5 addSubview:subview8];
    
    FGFBFindCloneView *findCloneView = [[FGFBFindCloneView alloc] initWithViewA:viewA viewB:viewB];
    
    XCTAssertTrue([findCloneView findEquivalentViewForView:subview1] == subview5);
    XCTAssertTrue([findCloneView findEquivalentViewForView:subview2] == subview6);
    XCTAssertTrue([findCloneView findEquivalentViewForView:subview3] == subview7);
    XCTAssertTrue([findCloneView findEquivalentViewForView:subview4] == subview8);
}

@end
