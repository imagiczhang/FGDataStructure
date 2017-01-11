//
//  FindKthSumInTwoArrays.h
//  FGDataStructure
//
//  Created by Stephen Zhang on 9/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

//Given two integer arrays sorted in ascending order and an integer k. Define sum = a + b, where a is an element from the first array and b is an element from the second one. Find the kth smallest sum out of all possible sums.
//
//Example
//Given [1, 7, 11] and [2, 4, 6].
//
//For k = 3, return 7.
//
//For k = 4, return 9.
//
//For k = 8, return 15.

@interface FindKthSumInTwoArrays : NSObject

+ (NSInteger)findKthSum:(NSInteger)k inArray:(NSArray<NSNumber *> *)array1 andArray:(NSArray<NSNumber *> *)array2;

@end
