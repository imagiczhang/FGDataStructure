//
//  FGStack.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 26/04/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGStack.h"

@interface FGStack ()

@property (nonatomic, strong) NSMutableArray<NSObject *> *stackArray;
@property (nonatomic, assign) NSUInteger capacity;

@end

@implementation FGStack

- (instancetype)initWithCapacity:(NSUInteger)capacity
{
    if (self = [super init]) {
        _stackArray = [[NSMutableArray alloc] initWithCapacity:capacity];
        _capacity = capacity;
    }
    
    return self;
}

- (void)push:(NSObject *)object
{
    if (![self isFull]) {
        [_stackArray addObject:object];
    }
}

- (NSObject *)top
{
    if (![self isEmpty]) {
        return [_stackArray lastObject];
    }
    
    return nil;
}

- (void)pop
{
    if (![self isEmpty]) {
        [_stackArray removeLastObject];
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
