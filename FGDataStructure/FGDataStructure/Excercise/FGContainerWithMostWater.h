//
//  FGContainerWithMostWater.h
//  FGDataStructure
//
//  Created by Stephen Zhang on 29/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

//Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.
//Example
//Given [1,3,2], the max area of the container is 2.

@interface FGContainerWithMostWater : NSObject

+ (NSInteger)maxWaterInContainersOfArray:(NSArray<NSNumber *> *)array;

@end
