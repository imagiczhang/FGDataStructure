//
//  NSNumber+FGComparsion.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 31/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "NSNumber+FGComparsion.h"

@implementation NSNumber (FGComparsion)

- (BOOL)isGreaterThan:(NSNumber *)obj
{
    NSParameterAssert([obj isKindOfClass:[NSNumber class]]);
    return [self compare:obj] == NSOrderedDescending;
}

- (BOOL)isLessThan:(NSNumber *)obj
{
    NSParameterAssert([obj isKindOfClass:[NSNumber class]]);
    return [self compare:obj] == NSOrderedAscending;
}

@end
