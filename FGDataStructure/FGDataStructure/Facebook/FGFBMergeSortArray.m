//
//  FGFBMergeSortArray.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 17/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGFBMergeSortArray.h"

@interface FGFBMergeEumerator : NSObject

@property (nonatomic, strong) NSEnumerator *enumerator;
@property (nonatomic, assign) NSInteger currentValue;
@property (nonatomic, assign) BOOL isEnd;

- (instancetype)initWithArray:(NSArray *)array;
- (void)next;

@end

@implementation FGFBMergeEumerator

- (instancetype)initWithArray:(NSArray *)array {
    if (self = [super init]) {
        _enumerator = [array objectEnumerator];
        _currentValue = [[_enumerator nextObject] integerValue];
        _isEnd = NO;
    }
    
    return self;
}

- (void)next {
    id object = [_enumerator nextObject];
    if (!object) {
        _isEnd = YES;
    } else {
        _currentValue = [object integerValue];
    }
}

@end


@implementation FGFBMergeSortArray

+ (NSArray *)mergedArrayFromArrays:(NSArray *)arrays {
    NSMutableArray *enumerators = [NSMutableArray array];
    for (NSArray *array in arrays) {
        [enumerators addObject:[[FGFBMergeEumerator alloc] initWithArray:array]];
    }
    
    NSMutableArray *sortedArray = [NSMutableArray array];
    
    while (YES) {
        NSInteger smallest = NSIntegerMax;
        FGFBMergeEumerator *smallestEnumerator;
        NSInteger index = 0;
        
        for (FGFBMergeEumerator *enumerator in enumerators) {
            if (!enumerator.isEnd) {
                if (smallest > enumerator.currentValue) {
                    smallest = enumerator.currentValue;
                    smallestEnumerator = enumerator;
                }
                index++;
            }
        }
        
        if (index == 0) break;
        
        index = 0;
        
        [smallestEnumerator next];
        
        [sortedArray addObject:@(smallest)];
    }
    
    return sortedArray;
}

@end

