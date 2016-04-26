//
//  FGStack.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 26/04/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  A stack is a basic data structure that can be logically thought as linear structure represented by a real physical stack or pile, a structure where insertion and deletion of items takes place at one end called top of the stack. The basic concept can be illustrated by thinking of your data set as a stack of plates or books where you can only take the top item off the stack in order to remove things from it. This structure is used all throughout programming.
 
 The basic implementation of a stack is also called a LIFO (Last In First Out) to demonstrate the way it accesses data, since as we will see there are various variations of stack implementations.
 
 There are basically three operations that can be performed on stacks . They are 1) inserting an item into a stack (push). 2) deleting an item from the stack (pop). 3) displaying the contents of the stack(pip).
 */
@interface FGStack : NSObject

/**
 *  Adds an item onto the stack.
 *
 *  @param object The object will be added into stack
 */
- (void)push:(NSObject *)object;

/**
 *  @return the last item pushed onto the stack
 */
- (NSObject *)top;

/**
 *  Removes the most-recently-pushed item from the stack.
 */
- (void)pop;

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

/**
 *  Initialiser for the class
 *
 *  @param capacity the max capacity for the stack
 *
 *  @return a new instance
 */
- (instancetype)initWithCapacity:(NSUInteger)capacity;


@end
