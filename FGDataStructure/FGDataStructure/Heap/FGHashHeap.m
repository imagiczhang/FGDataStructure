//
//  FGHeap2.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 6/12/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGHashHeap.h"

@interface FGHashHeap ()

@property (nonatomic, strong) NSComparator comparator;
@property (nonatomic, strong) NSMutableArray<id<NSCopying>> *array;
@property (nonatomic, strong) NSMutableDictionary<id<NSCopying>, NSNumber *> *location;
@property (nonatomic, strong) NSMutableDictionary<id<NSCopying>, NSNumber *> *count;

@end

@implementation FGHashHeap

- (instancetype)initWithComparator:(NSComparator)comparator
{
    if (self = [super init]) {
        _comparator = comparator;
        _array = [NSMutableArray array];
        _location = [NSMutableDictionary dictionary];
        _count = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)addItem:(id<NSCopying>)item
{
    if (self.location[item]) {
        self.count[item] = @([self.count[item] unsignedIntegerValue] + 1);
    } else {
        [self.array addObject:item];
        self.location[item] = @(self.array.count - 1);
        self.count[item] = @(1);
        [self siftUpWithIndex:self.array.count - 1];
    }
}

- (void)deleteItem:(id<NSCopying>)item
{
    if (self.location[item]) {
        if ([self.count[item] isEqualToNumber:@1]) {
            NSUInteger index = [self.location[item] unsignedIntegerValue];
            NSUInteger lastIndex =  self.array.count - 1;
            id<NSCopying> lastItem = self.array[lastIndex];
            [self.array exchangeObjectAtIndex:index withObjectAtIndex:lastIndex];
            self.location[lastItem] = @(index);
            [self.array removeLastObject];
            [self.location removeObjectForKey:item];
            [self.count removeObjectForKey:item];
            [self siftDownWithIndex:index];
            [self siftUpWithIndex:[self.location[lastItem] unsignedIntegerValue]];
        } else {
            self.count[item] = @([self.count[item] unsignedIntegerValue] - 1);
        }
    }
}

- (id<NSCopying>)peek
{
    if (self.array.count > 0) {
        return [self.array firstObject];
    } else {
        return nil;
    }
}

- (id<NSCopying>)poll
{
    id<NSCopying> result = [self peek];
    if (result) {
        [self deleteItem:result];
    }
    return result;
}

#pragma mark - Private

- (void)siftUpWithIndex:(NSUInteger)index
{
    id<NSCopying>item = [self.array objectAtIndex:index];
    while(index > 0) {
        id<NSCopying>parent = [self.array objectAtIndex:(index - 1)/2];
        NSComparisonResult compareResult = self.comparator(item, parent);
        if (compareResult == NSOrderedAscending) {
            [self.array exchangeObjectAtIndex:index withObjectAtIndex:(index - 1)/2];
            self.location[parent] = @(index);
            index = (index - 1)/2;
            self.location[item] = @(index);
        } else {
            break;
        }
    }
}

- (void)siftDownWithIndex:(NSUInteger)index
{
    id<NSCopying>item = [self.array objectAtIndex:index];
    while(index * 2 + 1 < self.array.count) {
        NSUInteger sonIndex = index*2 + 1;
        if (sonIndex + 1 < self.array.count) {
            NSComparisonResult sonCompareResult = self.comparator(self.array[sonIndex], self.array[sonIndex+1]);
            if (sonCompareResult == NSOrderedDescending) {
                sonIndex += 1;
            }
        }
        NSComparisonResult compareResult = self.comparator(item, self.array[sonIndex]);
        if (compareResult == NSOrderedDescending) {
            self.location[self.array[sonIndex]] = @(index);
            [self.array exchangeObjectAtIndex:index withObjectAtIndex:sonIndex];
            index = sonIndex;
            self.location[item] = @(index);
        } else {
            break;
        }
    }
}

@end
