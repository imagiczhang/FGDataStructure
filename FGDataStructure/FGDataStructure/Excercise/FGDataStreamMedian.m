//
//  FGDataStreamMedian.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 27/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import "FGDataStreamMedian.h"
#import "FGHashHeap.h"

@implementation FGDataStreamMedian

+ (NSArray<NSNumber *> *)mediansForArray:(NSArray<NSNumber *> *)array
{
    FGHashHeap<NSNumber *> *maxHeap = [[FGHashHeap alloc] initWithComparator:^NSComparisonResult(id _Nonnull obj1, id _Nonnull obj2) {
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
    
    FGHashHeap<NSNumber *> *minHeap = [[FGHashHeap alloc] initWithComparator:^NSComparisonResult(id _Nonnull obj1, id _Nonnull obj2) {
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
    
    NSMutableArray<NSNumber *> *result = [NSMutableArray array];
    for (NSInteger i = 0; i < array.count; i++) {
        [minHeap addItem:array[i]];
        if (maxHeap.itemsCount < minHeap.itemsCount) {
            [maxHeap addItem:[minHeap poll]];
        } else if ([maxHeap peek].integerValue > [minHeap peek].integerValue) {
            [minHeap addItem:[maxHeap poll]];
            [maxHeap addItem:[minHeap poll]];
        }
        [result addObject:[maxHeap peek]];
    }
    return [result copy];
}

@end
