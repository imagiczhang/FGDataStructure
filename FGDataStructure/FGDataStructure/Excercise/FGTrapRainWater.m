//
//  FGTrapRainWater.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 14/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import "FGTrapRainWater.h"

@implementation FGTrapRainWater

+ (NSInteger)waterTrappedWithHeights:(NSArray<NSNumber *> *)heights
{
    if (heights.count <= 2) {
        return 0;
    }
    
    NSInteger i = 0;
    NSInteger j = heights.count-1;
    NSInteger leftLevel = 0;
    NSInteger rightLevel = 0;
    NSInteger trappedWater = 0;
    
    while (i < j ) {
        if (heights[i].integerValue < heights[j].integerValue) {
            leftLevel = MAX(leftLevel, heights[i].integerValue);
            trappedWater += (leftLevel - heights[i].integerValue);
            i++;
        } else {
            rightLevel = MAX(rightLevel, heights[j].integerValue);
            trappedWater += (rightLevel - heights[j].integerValue);
            j--;
        }
    }
    return trappedWater;
}

@end
