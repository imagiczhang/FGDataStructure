//
//  FGHeapify.h
//  FGDataStructure
//
//  Created by Stephen Zhang on 24/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

//Given an integer array, heapify it into a min-heap array.
//
//For a heap array A, A[0] is the root of heap, and for each A[i], A[i * 2 + 1] is the left child of A[i] and A[i * 2 + 2] is the right child of A[i].
//Example
//Given [3,2,1,4,5], return [1,2,3,4,5] or any legal heap array.

@interface FGHeapify : NSObject

+ (NSArray<NSNumber *> *)heapifyArray:(NSArray<NSNumber *> *)array;

@end
