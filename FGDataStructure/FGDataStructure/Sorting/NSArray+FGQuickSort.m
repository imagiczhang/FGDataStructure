//
//  NSMutableArray+FGQuickSort.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 29/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "NSArray+FGQuickSort.h"

@implementation NSArray (FGQuickSort)

- (NSArray *)quickSort
{
    NSUInteger count = [self count];
    
    if(count <= 1){
        return self;
    }
    
    // Choose pivot in the middle
    NSNumber *pivotValue = self[count/2];
    
    // Initial left (less) & right (more) array
    NSMutableArray *lessArray = [[NSMutableArray alloc] initWithCapacity:count];
    NSMutableArray *moreArray = [[NSMutableArray alloc] initWithCapacity:count];
    
    // Move numbers which are less than pivot into left (less) array
    // Move numbers which are more than pivot into right (more) array
    for (NSNumber* value in self) {
        if([value floatValue] < [pivotValue floatValue]){
            [lessArray addObject:value];
        } else if([value floatValue] > [pivotValue floatValue]){
            [moreArray addObject:value];
        }
    }
    
    NSMutableArray* sortedArray = [[NSMutableArray alloc] initWithCapacity:count];
    
    [sortedArray addObjectsFromArray:[lessArray quickSort]]; // left array recursive till only one element
    [sortedArray addObject:pivotValue];
    [sortedArray addObjectsFromArray:[moreArray quickSort]]; // right array recursive till only one element
    
    
    return [sortedArray copy];;
}

@end
