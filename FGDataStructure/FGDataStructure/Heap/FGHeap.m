//
//  FGHeap.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 27/04/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGHeap.h"

@interface FGHeap ()

@property (nonatomic, strong) NSMutableArray *heap;

@end

@implementation FGHeap

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _heap = [@[] mutableCopy];
        [self.heap insertObject:@-1 atIndex:0];
    }
    return self;
}

- (void)insertNumber:(NSNumber *)number
{
    [self.heap addObject:number];
    
    for (NSInteger i = [self.heap count] - 1; [number integerValue] < [self.heap[i / 2] integerValue]; i /= 2) {
        [self.heap exchangeObjectAtIndex:i withObjectAtIndex:i / 2];
    }
}

- (NSNumber *)deleteMin
{
    NSUInteger child, i;
    if ([self isEmpty]) {
        NSAssert(self.heap.count > 1, @"Binary heap is empty");
        return nil;
    }
    else {
        NSNumber *minNumber  = [(self.heap)[1] copy];
        NSNumber *lastNumber = [self.heap lastObject];
        
        for (i = 1; i * 2 <= self.heap.count - 1; i = child) {
            child = i * 2;
            if ((child != self.heap.count - 1) && ([self.heap[child + 1] integerValue] < [self.heap[child] integerValue])) {
                child++;
            }
            if ([lastNumber integerValue] > [self.heap[child] integerValue]) {
                [self.heap exchangeObjectAtIndex:i withObjectAtIndex:child];
            }
            else
                break;
        }
        (self.heap)[i] = lastNumber;
        [self.heap removeLastObject];
        
        return minNumber;
    }
}

- (BOOL)isEmpty
{
    return self.heap.count <= 1 ? YES : NO;
}

@end
