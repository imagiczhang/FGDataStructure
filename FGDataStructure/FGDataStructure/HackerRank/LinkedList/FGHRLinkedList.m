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
        _head = head;
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
    [self.result removeAllObjects];
    [self printListWithNode:self.head];
    return [self.result componentsJoinedByString:@"\n"];
}

- (void)insertToTail:(int)data {
    FGHRLinkedListNode *tailNode = self.head;
    
    while (tailNode.next) {
        tailNode = tailNode.next;
    }
    
    FGHRLinkedListNode *newNode = [[FGHRLinkedListNode alloc] initWithData:data next:nil];
    
    tailNode.next = newNode;
}

- (void)insertToHead:(int)data {
    FGHRLinkedListNode *newNode = [[FGHRLinkedListNode alloc] initWithData:data next:self.head];
    
    self.head = newNode;
}

- (void)insert:(int)data toPosition:(int)position {
    FGHRLinkedListNode *newNode = [[FGHRLinkedListNode alloc] initWithData:data next:nil];
    FGHRLinkedListNode *previous = nil;
    FGHRLinkedListNode *next = self.head;
    
    if (position == 0) {
        newNode.next = self.head;
        self.head = newNode;
        return;
    }
    
    for (int i = 0; i < position; i++) {
        previous = next;
        next = next.next;
    }
    
    newNode.next = next;
    previous.next = newNode;
}

- (void)deleteInPosition:(int)position {
    FGHRLinkedListNode *previous = nil;
    FGHRLinkedListNode *current = self.head;
    FGHRLinkedListNode *next = self.head.next;
    
    if (position == 0) {
        self.head = next;
        return;
    }
    
    for (int i = 0; i < position; i++) {
        previous = current;
        current = next;
        next = next.next;
    }
    
    previous.next = next;
}

- (NSString *)reversedValues {
    [self.result removeAllObjects];
    
    [self printListWithNode:[self reverse]];
    return [self.result componentsJoinedByString:@"\n"];
}

- (FGHRLinkedListNode *)reverse {
    FGHRLinkedListNode *previous = nil;
    FGHRLinkedListNode *current = self.head.copy;
    FGHRLinkedListNode *next = current.next;
    
    while (current.next) {
        next = current.next;
        // reversing the link
        current.next = previous;
        // moving currentNode and previousNode by 1 node
        previous = current;
        current = next;
    }
    
    current.next = previous;
    
    return current;
}

- (BOOL)isEqualToHead:(FGHRLinkedListNode *)head {
    FGHRLinkedListNode *currentA = self.head.copy;
    FGHRLinkedListNode *currentB = head.copy;
    
    while (currentA.next) {
        if (!currentB.next) return NO;
        if (currentA.data != currentB.data) return NO;
        currentA = currentA.next;
        currentB = currentB.next;
    }
    
    if (currentA.data != currentB.data) return NO;
    
    if (currentB.next) return NO;
    
    return YES;
}

- (void)mergeSortedWithSortedHead:(FGHRLinkedListNode *)head {
    FGHRLinkedListNode *head1 = head.copy;
    FGHRLinkedListNode *head2 = self.head.copy;
    FGHRLinkedListNode *newHead = [[FGHRLinkedListNode alloc] initWithData:0 next:nil];
    FGHRLinkedListNode *currentHead = newHead;
    
    while (head1 && head2) {
        if (head1.data <= head2.data) {
            currentHead.next = head1;
            head1 = head1.next;
        } else {
            currentHead.next = head2;
            head2 = head2.next;
        }
        
        currentHead = currentHead.next;
    }
    
    if (head1) {
        currentHead.next = head1;
    }
    
    if (head2) {
        currentHead.next = head2;
    }
    
    self.head = newHead.next;
}

- (int)nodeValueFromPositionFromTail:(int)position {
    FGHRLinkedListNode *node = [self reverse];
    
    for (int i = 0; i < position; i++) {
        node = node.next;
    }
    
    return node.data;
}

- (void)removeDuplicates {
    FGHRLinkedListNode *current = self.head;
    
    while (current) {
        if (current.data == current.next.data) {
            current.next = current.next.next;
        } else {
            current = current.next;
        }
    }
}

- (BOOL)hasCycle {
    if(!self.head) // list does not exist..so no loop either.
        return NO;
    
    FGHRLinkedListNode *slow, *fast; // create two references.
    
    slow = fast = self.head; // make both refer to the start of the list.
    
    while (YES) {
        
        slow = slow.next;          // 1 hop.
        
        if (fast.next)
            fast = fast.next.next; // 2 hops.
        else
            return NO;          // next node null => no loop.
        
        if (!slow || !fast) // if either hits null..no loop.
            return NO;
        
        if (slow == fast) // if the two ever meet...we must have a loop.
            return YES;
    }
}

- (FGHRLinkedListNode *)findMergeNode:(FGHRLinkedListNode *)head {
    FGHRLinkedListNode *headA = self.head;
    FGHRLinkedListNode *headB = head;
    
    NSInteger sizeA = [headA size];
    NSInteger sizeB = [headB size];
    
    if (sizeA - sizeB > 0) {
        for (NSInteger i = 0; i < sizeA - sizeB; i++) {
            headA = headA.next;
        }
    } else if (sizeA - sizeB < 0) {
        for (NSInteger i = 0; i < sizeB - sizeA; i++) {
            headB = headB.next;
        }
    }
    
    while (headA.next != headB.next) {
        headA = headA.next;
        headB = headB.next;
    }
    
    return headA.next;
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

- (id)copyWithZone:(NSZone *)zone {
    FGHRLinkedListNode *nodeCopy = [[FGHRLinkedListNode allocWithZone:zone] init];
    
    nodeCopy.next = _next.copy;
    nodeCopy.data = _data;
    
    return nodeCopy;
}

- (NSUInteger)size {
    NSUInteger size = 0;
    FGHRLinkedListNode *currentNode = self;
    while (currentNode) {
        size++;
        currentNode = currentNode.next;
    }
    
    return size;
}

@end