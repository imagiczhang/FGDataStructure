//
//  FGFBNestedArray2.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 8/12/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGFBNestedArray2.h"


@interface FGFBNestedArray2()

@property (nonatomic, strong) NSMutableArray<NSEnumerator *> *enumerators;
@property (nonatomic, strong) NSArray *array;

@end

@implementation FGFBNestedArray2

- (instancetype)initWithNestedArray:(NSArray *)nestedArray
{
    if (self = [super init]) {
        _array = [nestedArray copy];
        _enumerators = [NSMutableArray array];
        [_enumerators addObject:[_array objectEnumerator]];
    }
    return self;
}

- (NSString *)nextObject
{
    NSEnumerator *currentEnumerator = [self.enumerators lastObject];
    if (!currentEnumerator) {
        return nil;
    }
    NSObject *next;
    while (currentEnumerator) {
        next = [currentEnumerator nextObject];
        if (!next) {
            [self.enumerators removeLastObject];
            currentEnumerator = [self.enumerators lastObject];
        } else if ([next isKindOfClass:[NSArray class]]) {
            [self.enumerators addObject:[(NSArray *)next objectEnumerator]];
            currentEnumerator = [self.enumerators lastObject];
        } else {
            break;
        }
    }
    return (NSString *)next;
}


@end
