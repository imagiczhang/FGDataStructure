//
//  FGFBRemoveDuplicates.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 18/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGFBRemoveDuplicates.h"

@implementation FGFBRemoveDuplicates

+ (NSArray *)removeDuplicatesByUsingSetFrom:(NSArray *)array {
    NSOrderedSet *set = [NSOrderedSet orderedSetWithArray:array];
    return [set array];
}

@end
