//
//  FGFBDynamicMedian.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 9/12/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGFBDynamicMedian.h"
#import "FGHashHeap.h"

@interface FGFBDynamicMedian ()

@property (nonatomic, strong) FGHashHeap<NSNumber *> *bigEnd;
@property (nonatomic, strong) FGHashHeap<NSNumber *> *littleEnd;
@property (nonatomic) NSUInteger bigEndCount;
@property (nonatomic) NSUInteger littleEndCount;

@end

@implementation FGFBDynamicMedian

- (instancetype)init
{
    if (self = [super init]) {
        _bigEnd = [[FGHashHeap alloc] initWithComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            NSInteger num1 = [obj1 integerValue];
            NSInteger num2 = [obj2 integerValue];
            
            if (num1 < num2) {
                return NSOrderedAscending;
            } else if (num1 > num2) {
                return NSOrderedDescending;
            } else {
                return NSOrderedSame;
            }
        }];
        
        _littleEnd = [[FGHashHeap alloc] initWithComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            NSInteger num1 = [obj1 integerValue];
            NSInteger num2 = [obj2 integerValue];
            
            if (num1 > num2) {
                return NSOrderedAscending;
            } else if (num1 < num2) {
                return NSOrderedDescending;
            } else {
                return NSOrderedSame;
            }
        }];
        
        _bigEndCount = 0;
        _littleEndCount = 0;
    }
    return self;
}

- (void)addNumber:(NSNumber *)number
{
    [self.bigEnd addItem:number];
    self.bigEndCount++;
    
    if (self.bigEndCount > self.littleEndCount + 1) {
        NSNumber *shiftNumber = [self.bigEnd poll];
        [self.littleEnd addItem:shiftNumber];
        self.bigEndCount--;
        self.littleEndCount++;
    } else if (self.littleEndCount > 0 && [[self.bigEnd peek] integerValue] < [[self.littleEnd peek] integerValue]) {
        //swap the head of bigEnd and littleEnd heap
        NSNumber *bigEndTop = [self.bigEnd poll];
        NSNumber *littleEndTop = [self.littleEnd poll];
        [self.bigEnd addItem:littleEndTop];
        [self.littleEnd addItem:bigEndTop];
    }
}

- (NSNumber *)median
{
    if(self.bigEndCount > self.littleEndCount) {
        return [self.bigEnd peek];
    } else {
        return @(([[self.bigEnd peek] integerValue] + [[self.littleEnd peek] integerValue])/2.0);
    }
}

@end
