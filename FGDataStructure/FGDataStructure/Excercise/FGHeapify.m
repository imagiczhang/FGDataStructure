//
//  FGHeapify.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 24/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import "FGHeapify.h"

@implementation FGHeapify

+ (NSArray<NSNumber *> *)heapifyArray:(NSArray<NSNumber *> *)array
{
    NSMutableArray<NSNumber *> *mutableArray = [array mutableCopy];
    NSInteger n = mutableArray.count;
    for (NSInteger i = n/2 -1; i >= 0; i--) {
        [self siftDownArray:mutableArray atIndex:i];
    }
    return [mutableArray copy];
}

+ (void)siftDownArray:(NSMutableArray<NSNumber *> *)mutableArray atIndex:(NSInteger)index
{
    if (2 * index + 1 >= mutableArray.count) {
        return;
    }
    
    if (2 * index + 2 < mutableArray.count) {
        NSInteger minimalChild = mutableArray[2 * index + 2].integerValue < mutableArray[2 * index + 1].integerValue ? 2 * index + 2 : 2 * index + 1;
        if (mutableArray[minimalChild].integerValue < mutableArray[index].integerValue) {
            [mutableArray exchangeObjectAtIndex:index withObjectAtIndex:minimalChild];
            [self siftDownArray:mutableArray atIndex:minimalChild];
        }
    } else if (2 * index + 1 < mutableArray.count) {
        if (mutableArray[2 * index + 1].integerValue < mutableArray[index].integerValue) {
            [mutableArray exchangeObjectAtIndex:index withObjectAtIndex:2 * index + 1];
            [self siftDownArray:mutableArray atIndex:2 * index + 1];
        }
    }
}

@end
