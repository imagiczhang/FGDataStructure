//
//  FGTrapRainWater.h
//  FGDataStructure
//
//  Created by Stephen Zhang on 14/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>
//
//Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.
//Example
//Given [0,1,0,2,1,0,1,3,2,1,2,1], return 6.

@interface FGTrapRainWater : NSObject

+ (NSInteger)waterTrappedWithHeights:(NSArray<NSNumber *> *)heights;

@end
