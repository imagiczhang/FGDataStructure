//
//  FGFBStringConversionToNumber.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 7/02/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import "FGFBStringConversionToNumber.h"

@implementation FGFBStringConversionToNumber

+ (NSInteger)integerFromString:(NSString *)numString
{
    if (!numString || numString.length == 0) {
        return 0;
    }
    
    BOOL negative = NO;
    NSInteger result = 0;
    for (NSInteger i = 0; i < numString.length; i++) {
        if (i == 0 && [numString characterAtIndex:i] == [@"-" characterAtIndex:0]) {
            negative = YES;
        } else {
            result = result * 10;
            result += [numString characterAtIndex:i] - [@"0" characterAtIndex:0];
        }
    }
    
    return negative ? -result : result;
}

@end
