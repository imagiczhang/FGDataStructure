//
//  FGSlidingWindowMedian.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 27/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import "FGSlidingWindowMedian.h"
#import "FGHashHeap.h"

@implementation FGSlidingWindowMedian

+ (NSArray<NSNumber *> *)mediansInArray:(NSArray<NSNumber *> *)array withWindowSize:(NSInteger)k
{
    NSInteger n = array.count;
    NSMutableArray<NSNumber *> *result = [NSMutableArray array];
    if (k > n) {
        return [result copy];
    }
    
    FGHashHeap<NSNumber *> *maxHeap = [[FGHashHeap alloc] initWithComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSNumber *number1 = obj1;
        NSNumber *number2 = obj2;
        if (number1.integerValue < number2.integerValue) {
            return NSOrderedDescending;
        } else if (number1.integerValue > number2.integerValue) {
            return NSOrderedAscending;
        } else {
            return NSOrderedSame;
        }
    }];
    
    FGHashHeap<NSNumber *> *minHeap = [[FGHashHeap alloc] initWithComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSNumber *number1 = obj1;
        NSNumber *number2 = obj2;
        if (number1.integerValue < number2.integerValue) {
            return NSOrderedAscending;
        } else if (number1.integerValue > number2.integerValue) {
            return NSOrderedDescending;
        } else {
            return NSOrderedSame;
        }
    }];
    
    for (NSInteger i = 0; i < k; i++) {
        [minHeap addItem:array[i]];
        if (minHeap.itemsCount > maxHeap.itemsCount) {
            [maxHeap addItem:[minHeap poll]];
        } else if ([minHeap peek].integerValue < [maxHeap peek].integerValue) {
            [minHeap addItem:[maxHeap poll]];
            [maxHeap addItem:[minHeap poll]];
        }
    }
    [result addObject:[maxHeap peek]];
    
    for (NSInteger i = k; i < n; i++) {
        if ([minHeap deleteItem:array[i-k]]) {
            [minHeap addItem:array[i]];
            if ([minHeap peek].integerValue < [maxHeap peek].integerValue) {
                [minHeap addItem:[maxHeap poll]];
                [maxHeap addItem:[minHeap poll]];
            }
        } else if ([maxHeap deleteItem:array[i-k]]) {
            [minHeap addItem:array[i]];
            [maxHeap addItem:[minHeap poll]];
        }
        [result addObject:[maxHeap peek]];
    }
    return [result copy];
}

@end
