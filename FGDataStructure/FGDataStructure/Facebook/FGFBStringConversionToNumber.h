//
//  FGFBStringConversionToNumber.h
//  FGDataStructure
//
//  Created by Stephen Zhang on 7/02/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

// Given a string representing an Integer like "123" "-57" and etc., convert the string to NSInteger without using intValue or integerValue in NSString

@interface FGFBStringConversionToNumber : NSObject

+ (NSInteger)integerFromString:(NSString *)numString;

@end
