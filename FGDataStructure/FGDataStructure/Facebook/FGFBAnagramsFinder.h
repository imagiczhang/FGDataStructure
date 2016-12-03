//
//  FGFBAnagramsFinder.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 17/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Given an array of words, write a method that determines whether there are any words in this array that are anagrams of each other.
 
 Sample #1: @[@"bag", @"bat", @"tab"]; // output TRUE
 
 Sample #2: @[@"gab", @"bat", @"laf"]; // output FALSE
 */
@interface FGFBAnagramsFinder : NSObject

+ (BOOL)hasAnagramsByUsingSortFromArray:(NSArray *)words;
+ (BOOL)hasAnagramsByUsingHashFromArray:(NSArray<NSString *> *)words;

@end
