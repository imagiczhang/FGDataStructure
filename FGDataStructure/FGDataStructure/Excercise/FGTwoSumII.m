//
//  FGTwoSumII.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 8/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import "FGTwoSumII.h"

@implementation FGTwoSumII

+ (NSInteger)findPairsLargerThanTarget:(NSInteger)target inArray:(NSArray<NSNumber *> *)array
{
    if (array.count < 2) {
        return 0;
    }
    
    NSArray<NSNumber *> *sortedArray = [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
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
    
    NSInteger i = 0;
    NSInteger j = sortedArray.count-1;
    NSInteger result = 0;
    
    while (i < j) {
        if (sortedArray[i].integerValue + sortedArray[j].integerValue > target) {
            result += (j-i);
            j--;
        } else {
            i++;
        }
    }
    return result;
}

@end
