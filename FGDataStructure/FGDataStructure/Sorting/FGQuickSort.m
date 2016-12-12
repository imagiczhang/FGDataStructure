//
//  FGQuickSort.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 12/12/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGQuickSort.h"

@implementation FGQuickSort

+ (NSArray<NSNumber *> *)sortArray:(NSArray<NSNumber *> *)array partitionType:(FGQuickSortPartitionType)partitionType
{
    NSMutableArray<NSNumber *> *mutableArray = [array mutableCopy];
    [self sortMutableArray:mutableArray start:0 end:mutableArray.count - 1 partitionType:partitionType];
    return [mutableArray copy];
}

+ (void)sortMutableArray:(NSMutableArray *)array start:(NSInteger)start end:(NSInteger)end partitionType:(FGQuickSortPartitionType)partitionType
{
    if (start >= end) {
        return;
    }
    
    NSInteger pivotIndex;
    NSUInteger pivotLength = 1;
    switch (partitionType){
        case FGQuickSortPartitionTypeHoare:
            pivotIndex = [self hoarePartitionArray:array start:start end:end];
            break;
        case FGQuickSortPartitionTypeLomuto:
            pivotIndex = [self lomutoPartitionArray:array start:start end:end];
            break;
        case FGQuickSortPartitionType3Way: {
            NSRange range = [self threeWayPartitionArray:array start:start end:end];
            pivotIndex = range.location;
            pivotLength = range.length;
            break;
        }
        default:
            return;
    }
    [self sortMutableArray:array start:start end:pivotIndex - 1 partitionType:partitionType];
    [self sortMutableArray:array start:pivotIndex + pivotLength end:end partitionType:partitionType];
}

+ (NSRange)threeWayPartitionArray:(NSMutableArray<NSNumber *> *)array start:(NSInteger)start end:(NSInteger)end
{
    if (start >= end) {
        return NSMakeRange(end, 1);
    }
    
    NSUInteger i = start;
    NSUInteger left = start;
    NSUInteger right = end;
    NSInteger pivot = [array[end] integerValue];
    
    while (i <= right) {
        if ([array[i] integerValue] < pivot) {
            [array exchangeObjectAtIndex:i withObjectAtIndex:left];
            i++;
            left++;
        } else if ([array[i] integerValue] > pivot) {
            [array exchangeObjectAtIndex:i withObjectAtIndex:right];
            right--;
        } else {
            i++;
        }
    }
    return NSMakeRange(left, right - left + 1);
}

+ (NSUInteger)lomutoPartitionArray:(NSMutableArray<NSNumber *> *)array start:(NSInteger)start end:(NSInteger)end
{
    if (start >= end) {
        return end;
    }
    
    NSUInteger i = start;
    NSUInteger j = start;
    NSInteger pivot = [array[end] integerValue];
    for (; j <= end; j++) {
        if([array[j] integerValue] < pivot) {
            [array exchangeObjectAtIndex:i withObjectAtIndex:j];
            i++;
        }
    }
    
    [array exchangeObjectAtIndex:i withObjectAtIndex:end];
    return i;
}

+ (NSUInteger)hoarePartitionArray:(NSMutableArray<NSNumber *> *)array start:(NSInteger)start end:(NSInteger)end
{
    if (start >= end) {
        return end;
    }
    
    NSUInteger left = start;
    NSUInteger right = end;
    NSInteger pivot =  [array[end] integerValue];
    
    while (left < right) {
        while (left < right && [array[left] integerValue] < pivot) {
            left++;
        }
        while (left < right && [array[right] integerValue] >= pivot) {
            right--;
        }
        
        if (left < right) {
            [array exchangeObjectAtIndex:left withObjectAtIndex:right];
        }
    }
    
    [array exchangeObjectAtIndex:right withObjectAtIndex:end];
    return right;
}

@end
