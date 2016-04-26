//
//  FGQueue.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 26/04/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGQueue.h"

@interface FGQueue ()

@property (nonatomic, strong) NSMutableArray<NSObject *> *stackArray;
@property (nonatomic, assign) NSUInteger capacity;

@end

@implementation FGQueue

- (instancetype)initWithCapacity:(NSUInteger)capacity
{
    if (self = [super init]) {
        _stackArray = [[NSMutableArray alloc] initWithCapacity:capacity];
        _capacity = capacity;
    }
    
    return self;
}

- (void)enqueue:(NSObject *)object
{
    if (![self isFull]) {
        [_stackArray addObject:object];
    }
}

- (NSObject *)front
{
    if (![self isEmpty]) {
        return [_stackArray firstObject];
    }
    
    return nil;
}

- (void)dequeue
{
    if (![self isEmpty]) {
        [_stackArray removeObjectAtIndex:0];
    }
}

- (BOOL)isEmpty
{
    return [self size] == 0;
}

- (BOOL)isFull
{
    return [self size] == self.capacity - 1;
}

- (NSInteger)size
{
    return self.stackArray.count;
}

@end
