//
//  FGGGNumberGroup.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 16/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGGGNumberGroup.h"

@implementation FGGGNumberGroup

+ (NSArray *)numberGroupFromNumbers:(NSArray *)numbers {
    NSMutableArray *group = [NSMutableArray array];
    
    for (NSInteger index = 0; index < numbers.count; index++) {
        NSMutableArray *array = [NSMutableArray array];
        [array addObject:numbers[index]];
        if (index != numbers.count - 1) {
            while ([numbers[index + 1] integerValue] == ([numbers[index] integerValue] + 1)) {
                index++;
                [array addObject:numbers[index]];
                
                if (index == numbers.count - 1) break;
            }
        }
        [group addObject:array];
    }
    
    return [group copy];
}

@end
