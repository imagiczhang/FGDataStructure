//
//  FGTwoSumII.h
//  FGDataStructure
//
//  Created by Stephen Zhang on 8/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

//Given an array of integers, find how many pairs in the array such that their sum is bigger than a specific target number. Please return the number of pairs.

@interface FGTwoSumII : NSObject

+ (NSInteger)findPairsLargerThanTarget:(NSInteger)target inArray:(NSArray<NSNumber *> *)array;

@end
