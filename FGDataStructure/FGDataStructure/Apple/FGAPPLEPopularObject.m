//
//  FGAPPLEPopularObject.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 18/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGAPPLEPopularObject.h"

@implementation FGAPPLEPopularObject

+ (NSString *)popularStringInArray:(NSArray *)array {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    // o(n)
    for (NSString *string in array) {
        NSNumber *value = [dictionary objectForKey:string];
        if (value) {
            [dictionary setObject:@([value integerValue] + 1) forKey:string];
        } else {
            [dictionary setObject:@0 forKey:string];
        }
    }
    
    NSArray *allObjects = [dictionary allKeys];
    NSString *largestKey = nil;
    NSInteger largestValue = NSIntegerMin;
    
    // o(n)
    for (NSString *string in allObjects) {
        if (largestValue < [dictionary[string] integerValue]) {
            largestKey = string;
            largestValue = [dictionary[string] integerValue];
        }
    }
    
    return largestKey;
}

@end
