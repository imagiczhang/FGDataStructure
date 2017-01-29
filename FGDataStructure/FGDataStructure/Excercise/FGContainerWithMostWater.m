//
//  FGContainerWithMostWater.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 29/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import "FGContainerWithMostWater.h"

@implementation FGContainerWithMostWater

+ (NSInteger)maxWaterInContainersOfArray:(NSArray<NSNumber *> *)array
{
    NSInteger i = 0;
    NSInteger j = array.count - 1;
    
    NSInteger max = 0;
    
    while (i < j) {
        NSInteger waterLevel = array[i].integerValue < array[j].integerValue ? array[i].integerValue : array[j].integerValue;
        NSInteger waterContained = waterLevel * (j - i);
        if (waterContained > max) {
            max = waterContained;
        }
        if (array[i].integerValue < array[j].integerValue) {
            i++;
        } else {
            j--;
        }
    }
    
    return max;
}

@end
