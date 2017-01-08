//
//  FGKLargestInNArrays.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 7/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import "FGKLargestInNArrays.h"
#import "FGHashHeap.h"

@implementation Element

- (instancetype)initWithValue:(NSInteger)value fromIndex:(NSUInteger)fromIndex
{
    if (self = [super init]) {
        _value = value;
        _fromIndex = fromIndex;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (BOOL)isEqual:(id)object
{
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[self class]]) {
        return NO;
    }
    
    return [self isEqualToElement:object];
}

- (BOOL)isEqualToElement:(Element *)element
{
    if (self.value == element.value && self.fromIndex == element.fromIndex) {
        return YES;
    }
    return NO;
}

- (NSUInteger)hash
{
    return self.value ^ self.fromIndex;
}

@end


@implementation FGKLargestInNArrays

+ (NSInteger)findKth:(NSUInteger)k inArrays:(NSArray<NSArray<NSNumber *> *> *)arrays
{
    NSUInteger n = arrays.count;
    if (n == 0) {
        return INT_MIN;
    }
    
    FGHashHeap<Element *> *maxHeap = [[FGHashHeap alloc] initWithComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        Element *element1 = obj1;
        Element *element2 = obj2;
        
        if (element1.value < element2.value){
            return NSOrderedDescending;
        } else if (element1.value > element2.value) {
            return NSOrderedAscending;
        } else {
            return NSOrderedSame;
        }
    }];
    
    NSMutableArray *mutableArrays = arrays.mutableCopy;
    
    NSUInteger index = 0;
    for (NSArray *array in arrays) {
        mutableArrays[index] = [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            NSNumber *number1 = obj1;
            NSNumber *number2 = obj2;
            if (number1.integerValue > number2.integerValue) {
                return NSOrderedAscending;
            } else if (number1.integerValue < number2.integerValue) {
                return NSOrderedDescending;
            } else {
                return NSOrderedSame;
            }
        }];
        index++;
    }
    
    index = 0;
    NSUInteger nextIndices[n];
    for (NSArray<NSNumber *> *array in mutableArrays) {
        if (array.count > 0) {
            Element *element = [[Element alloc] initWithValue:array[0].integerValue fromIndex:index];
            [maxHeap addItem:element];
            nextIndices[index] = 1;
        }
        index++;
    }
    
    for (int i = 0; i < k-1; i++) {
        Element *top = [maxHeap poll];
        if (nextIndices[top.fromIndex] < [mutableArrays[top.fromIndex] count]) {
            Element *element = [[Element alloc] initWithValue:[mutableArrays[top.fromIndex][nextIndices[top.fromIndex]] integerValue] fromIndex:top.fromIndex];
            [maxHeap addItem:element];
            nextIndices[top.fromIndex] += 1;
        }
    }
    
    return [maxHeap peek].value;
}

@end
