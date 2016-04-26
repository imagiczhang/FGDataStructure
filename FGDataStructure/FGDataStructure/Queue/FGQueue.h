//
//  FGQueue.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 26/04/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  A queue is a basic data structure that is used throughout programming. You can think of it as a line in a grocery store. The first one in the line is the first one to be served.Just like a queue.
 
 A queue is also called a FIFO (First In First Out) to demonstrate the way it accesses data.
 */
@interface FGQueue : NSObject

/**
 *  Adds an item onto the end of the queue.
 *
 *  @param object will be added onto the end of the queue
 */
- (void)enqueue:(NSObject *)object;

/**
 *  @return the item at the front of the queue.
 */
- (NSObject *)front;

/**
 *  Removes the item from the front of the queue.
 */
- (void)dequeue;

/**
 *  Check if no more items can be popped and there is no top item
 *
 *  @return YES if no more items can be popped and there is no top item.
 */
- (BOOL)isEmpty;

/**
 *  Check if no more items can be pushed.
 *
 *  @return YES if no more items can be pushed.
 */
- (BOOL)isFull;

/**
 *  @return the number of elements on the stack.
 */
- (NSInteger)size;

@end
