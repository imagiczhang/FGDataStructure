//
//  FGFBQuestions.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 15/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FGFBQuestions : NSObject

/**
 *  Given an array (for example, [ 1, 0, 2, 0, 0, 3, 4 ]), implement methods that
 
 *  1. returns the number of non-zero elements (4)
 *  2. moves the non-zero elements to the beginning of the array (the rest of the elements don't matter)
 *  -> both [ 1, 2, 3, 4, 0, 0, 0] and [ 4, 1, 3, 2, X, Y, Z ] are valid
 */
+ (NSArray *)arrayByMovingZeroWithNumbers:(NSArray *)numbers;

@end
