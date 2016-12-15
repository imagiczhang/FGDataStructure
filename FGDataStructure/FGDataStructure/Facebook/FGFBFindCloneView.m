//
//  FGFBFindCloneView.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 14/12/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGFBFindCloneView.h"

@interface FGFBFindCloneView ()

@property (nonatomic, strong) UIView *viewA;
@property (nonatomic, strong) UIView *viewB;

@end

@implementation FGFBFindCloneView

- (instancetype)initWithViewA:(UIView *)viewA viewB:(UIView *)viewB
{
    if (self = [super init]) {
        _viewA = viewA;
        _viewB = viewB;
    }
    return self;
}

- (UIView *)findEquivalentViewForView:(UIView *)view
{
    NSMutableArray<NSNumber *> *path = [NSMutableArray array];
    
    while (view.superview) {
        if (view == self.viewA)
            break;
        [path addObject:@([[view.superview subviews] indexOfObject:view])];
        view = view.superview;
    }
    
    NSAssert(view == self.viewA, @"cannot find viewA in ancestors of view");
    
    NSEnumerator *enumerator = path.reverseObjectEnumerator;
    NSNumber *index = [enumerator nextObject];
    UIView *resultView = self.viewB;
    while (index) {
        resultView = resultView.subviews[index.unsignedIntegerValue];
        index = [enumerator nextObject];
    }
    return resultView;
}

@end
