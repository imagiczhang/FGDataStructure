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
+ (NSArray *)arrayByQuickMovingZeroWithNumbers:(NSArray *)numbers;

/**
 *  given an array of words, how to eliminate the duplicates?
 */
+ (NSArray *)removeDuplicatedWords:(NSArray *)words preserveOrder:(BOOL)preserveOrder;

/**
 In an unsorted array of negative and positive integers, write a function, hasSumOf3Ints(array, n), that returns true if you find three numbers in the array that add up to a passed number, "n".
 
 (ie. array of [3,10,2,-3,100,4,0,-103], and n=14, 10, 4, and 0 is found and thus it would return true)
 */
// - TODO: NSDICTIONARY
+ (BOOL)hasSumOf3IntsFromArray:(NSArray *)array target:(NSInteger)target;

/**
 Give the count and the number following in the series.
 for e.g 1122344 because it has two 1s, two 2s, one 3 and two 4s,
 so first line output : 21221324
 next line : 12112211121214 and so on...
 */
+ (NSString *)countConsecutiveNumbersFromString:(NSString *)string;
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
+ (NSInteger)simpleQuickBinaryNumber1:(NSInteger)binary1 addBinaryNumber2:(NSInteger)binary2;

/**
 *  Find kth largest in an array
 */
// TODo

/**
 *  Given the following filename/rules:
 
 johndoe_sdfjkldfj_ldfjlkfdsjfds_dfdjklfdsjs.txt
 
 Rules:
 johndoe is a distinct identifier (not a constant)
 any following items are tacked on with underscores separating them and each token contains a key value pair. The key is the first character and the value is the remaining characters.
 
 Parse this filename and return a dictionary/hashtable of values, removing any file extensions but also keeping in mind that this filename could end up with incorrect characters or incorrect amounts of characters.
 
 Example input:
 johndoe_sdfjkldfj_ldfjlkfdsjfds_dfdjklfdsjs.txt
 
 Example output:
 
  @{ @"NAME" : @"johndoe",
 @"s" : @"dfjkldfj",
 @"l" : @"dfjlkfdsjfds",
 @"d": @"fdjklfdsjs"
 }
 */
+ (NSDictionary *)dictionaryFromFilename:(NSString *)fileName;

/**
 *  `this is a test sentence` => `thisisatestsentense`
 *  `thiis iss a teest seentennce` => `iseen`
 *  `thiiis iss aa teeest seentennnce` => `ien`
 *  `thiiiis iss a teeest seeentennncccce` => `ic`
 */
+ (NSString *)longestConsecutiveCharacterFromString:(NSString *)string;
+ (NSString *)anotherLongestConsecutiveCharacterFromString:(NSString *)string;

/**
 *  Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
 *
 *  For example,
 *  "A man, a plan, a canal: Panama" is a palindrome.
 *  "race a car" is not a palindrome.
 */
+ (BOOL)isValidPalindromeFromString:(NSString *)string;

/**
 *  Given an array with n objects colored red, white or blue, sort them so that objects of the same color are adjacent, with the colors in the order red, white and blue.
 
 Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.
 */
+ (NSArray *)sortColour:(NSArray *)colours;
@end
