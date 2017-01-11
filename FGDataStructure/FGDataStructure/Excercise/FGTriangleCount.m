//
//  FGTriangleCount.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 10/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import "FGTriangleCount.h"
#import "FGTwoSumII.h"

@implementation FGTriangleCount

+ (NSInteger)findTriangleCountInArray:(NSArray<NSNumber *> *)array
{
    if (array.count < 3) {
        return 0;
    }
    NSArray<NSNumber *> *sortedArray = [array sortedArrayUsingComparator:^NSComparisonResult(NSNumber * _Nonnull number1, NSNumber * _Nonnull number2) {
        if (number1.integerValue < number2.integerValue) {
            return NSOrderedAscending;
        } else if (number1.integerValue > number2.integerValue) {
            return NSOrderedDescending;
        } else {
            return NSOrderedSame;
        }
    }];
    
    NSUInteger i = array.count - 1;
    NSInteger result = 0;
    while (i > 1) {
        NSArray<NSNumber *> *subArray = [sortedArray subarrayWithRange:NSMakeRange(0, i)];
        result += [FGTwoSumII findPairsLargerThanTarget:sortedArray[i].integerValue inArray:subArray];
        i--;
    }
    return result;
}

@end
