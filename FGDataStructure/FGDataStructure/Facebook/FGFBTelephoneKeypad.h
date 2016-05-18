//
//  FGFBTelephoneKeypad.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 18/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Given the following hashmap for numeric to alpha translation of a telephone keypad:
 
 NSDictionary* dict = @{@2: @[@"A", @"B", @"C"],
 @3: @[@"D", @"E", @"F"],
 @4: @[@"G", @"H", @"I"],
 @5: @[@"J", @"K", @"L"],
 @6: @[@"M", @"N", @"O"],
 @7: @[@"P", @"Q", @"R", @"S"],
 @8: @[@"T", @"U", @"V"],
 @9: @[@"W", @"X", @"Y", @"Z"]};
 
 Write a method that takes a phone number as input and returns all possible letter combinations for that phone number.
 */
@interface FGFBTelephoneKeypad : NSObject

+ (NSArray *)allCombinations:(NSInteger)numbers;

@end
