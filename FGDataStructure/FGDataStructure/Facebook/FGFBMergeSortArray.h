//
//  FGFBMergeSortArray.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 17/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Given a list of n sorted lists of numbers, write a method that returns one giant list of all the numbers in order.
 
 Example input:
 
 NSArray* input = @[
 @[@2, @5, @10],
 @[@25, @100, @105],
 @[@7, @42, @56],
 .......
 ];
 */
@interface FGFBMergeSortArray : NSObject

+ (NSArray *)mergedArrayFromArrays:(NSArray *)arrays;

@end
