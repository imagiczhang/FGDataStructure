//
//  FGFBRange.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 14/12/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGFBRange.h"

@implementation FGFBRange

+ (BOOL)range:(NSRange)range1 hasInterSectionWithRange:(NSRange)range2
{
    if (range1.length == 0 || range2.length == 0)
        return NO;
    
    NSUInteger range1Start = range1.location;
    NSUInteger range1End = range1.location + range1.length - 1;
    NSUInteger range2Start = range2.location;
    NSUInteger range2End = range2.location + range2.length - 1;
    
    if (range1Start >= range2Start && range1Start <= range2End)
        return YES;
    
    if (range2Start >= range1Start && range2Start <= range1End)
        return YES;
    
    return NO;
}

@end
