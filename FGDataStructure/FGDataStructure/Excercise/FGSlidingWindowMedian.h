//
//  FGSlidingWindowMedian.h
//  FGDataStructure
//
//  Created by Stephen Zhang on 27/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

//Given an array of n integer, and a moving window(size k), move the window at each iteration from the start of the array, find the median of the element inside the window at each moving. (If there are even numbers in the array, return the N/2-th number after sorting the element in the window. )
//Example
//For array [1,2,7,8,5], moving window size k = 3. return [2,7,7]
//
//At first the window is at the start of the array like this
//
//[ | 1,2,7 | ,8,5] , return the median 2;
//
//then the window move one step forward.
//
//[1, | 2,7,8 | ,5], return the median 7;
//
//then the window move one step forward again.
//
//[1,2, | 7,8,5 | ], return the median 7;

@interface FGSlidingWindowMedian : NSObject

+ (NSArray<NSNumber *> *)mediansInArray:(NSArray<NSNumber *> *)array withWindowSize:(NSInteger)k;

@end
