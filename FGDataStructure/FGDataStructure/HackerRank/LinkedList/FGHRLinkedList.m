 //
//  FGHRLinkedList.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 5/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGHRLinkedList.h"

@interface FGHRLinkedList ()

@property (nonatomic, strong) NSMutableArray *result;

@end

@implementation FGHRLinkedList

- (instancetype)initWithHead:(FGHRLinkedListNode *)head {
    if (self = [super init]) {
        _result = [NSMutableArray array];
        [self printListWithNode:head];
    }
    
    return self;
}

- (void)printListWithNode:(FGHRLinkedListNode *)node {
    [self.result addObject:@(node.data)];
    if (node.next) {
        [self printListWithNode:node.next];
    }
}

- (NSString *)values {
    return [self.result componentsJoinedByString:@"\n"];
}

@end

@implementation FGHRLinkedListNode

- (instancetype)initWithData:(int)data next:(FGHRLinkedListNode *)next {
    if (self = [super init]) {
        _data = data;
        _next = next;
    }
    
    return self;
}

@end