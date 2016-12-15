//
//  FGFBFindCloneView.h
//  FGDataStructure
//
//  Created by Stephen Zhang on 14/12/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// Given a UIView object viewA, viewB is the clone of viewA.
// The input is one of viewA's subviews, named as view1. Please find and return the equivalent view of
//view1 among viewB's subviews

@interface FGFBFindCloneView : NSObject

- (instancetype)initWithViewA:(UIView *)viewA viewB:(UIView *)viewB;

- (UIView *)findEquivalentViewForView:(UIView *)view;

@end
