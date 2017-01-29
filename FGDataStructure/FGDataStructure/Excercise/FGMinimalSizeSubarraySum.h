//
//  FGMinimalSizeSubarraySum.h
//  FGDataStructure
//
//  Created by Stephen Zhang on 28/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

//Given an array of n positive integers and a positive integer s, find the minimal length of a subarray of which the sum ≥ s. If there isn't one, return -1 instead.
//Example
//Given the array [2,3,1,2,4,3] and s = 7, the subarray [4,3] has the minimal length under the problem constraint.

@interface FGMinimalSizeSubarraySum : NSObject

+ (NSInteger)minimalSizeSubarrayinArray:(NSArray<NSNumber *> *)array withSumLargerThan:(NSInteger)target;

@end
