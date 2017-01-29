//
//  FGMinimalSizeSubarraySum.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 28/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import "FGMinimalSizeSubarraySum.h"

@implementation FGMinimalSizeSubarraySum

+ (NSInteger)minimalSizeSubarrayinArray:(NSArray<NSNumber *> *)array withSumLargerThan:(NSInteger)target
{
    NSInteger i = 0;
    NSInteger j = 0;
    NSInteger n = array.count;
    NSInteger result = -1;
    BOOL found = NO;
    NSInteger sum = array[0].integerValue;
    
    while (j < n) {
        if (sum >= target) {
            found = YES;
            if (result > 0) {
                result = result > (j-i+1) ? (j-i+1) : result;
            } else {
                result = j-i+1;
            }
            sum = sum - array[i].integerValue;
            i++;
        } else {
            j++;
            if (j < n) {
                sum = sum + array[j].integerValue;
            }
        }
        
        if (i > j) {
            j = i;
            if (j < n) {
                sum = array[j].integerValue;
            }
        }
    }
    
    return result;
}

@end
