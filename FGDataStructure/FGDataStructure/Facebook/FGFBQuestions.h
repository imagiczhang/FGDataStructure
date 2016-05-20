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

/**
 *  given an array of words, how to eliminate the duplicates?
 */
+ (NSArray *)removeDuplicatedWords:(NSArray *)words perserveOrder:(BOOL)perserveOrder;

/**
 In an unsorted array of negative and positive integers, write a function, hasSumOf3Ints(array, n), that returns true if you find three numbers in the array that add up to a passed number, "n".
 
 (ie. array of [3,10,2,-3,100,4,0,-103], and n=14, 10, 4, and 0 is found and thus it would return true)
 */
+ (BOOL)hasSumOf3IntsFromArray:(NSArray *)array target:(NSInteger)target;

/**
 Give the count and the number following in the series.
 for e.g 1122344
 first line output : 21221324
 next line : 12112211121214 and so on...
 */
+ (NSArray *)countNumbersFromString:(NSString *)string numberOfRecursives:(NSInteger)numberOfRecursives;

/**
 Given a string, find the length of the longest substring without repeating characters. For example, the longest substring without repeating letters for "abcabcbb" is "abc", which the length is 3. For "bbbbb" the longest substring is "b", with the length of 1.
 */
+ (NSInteger)findLongestSubstringInString:(NSString *)string;

/**
 *  Write a program for addition of two binary numbers
 */
+ (NSInteger)binaryNumber1:(NSInteger)binary1 addBinaryNumber2:(NSInteger)binary2;
+ (NSInteger)quickBinaryNumber1:(NSInteger)binary1 addBinaryNumber2:(NSInteger)binary2;

@end
