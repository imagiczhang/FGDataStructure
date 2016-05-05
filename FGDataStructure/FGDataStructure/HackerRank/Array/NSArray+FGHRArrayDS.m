//
//  NSArray+FGHRArrayDS.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 4/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "NSArray+FGHRArrayDS.h"

@implementation NSArray (FGHRArrayDS)

- (NSArray *)reverse
{
    NSMutableArray *reversed = self.mutableCopy;
    
    for (int i = 0; i < self.count / 2; i++) {
        id temp = reversed[i];
        reversed[i] = reversed[self.count - 1 - i];
        reversed[self.count - 1 - i] = temp;
    }
    
    return reversed.copy;
}

@end
