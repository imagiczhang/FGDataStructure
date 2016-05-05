//
//  NSArray+FGHRArrayDS.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 4/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  An array is a type of data structure that stores elements of the same type in a contiguous block of memory. In an array, A
 A
 , of size N
 N
 , each memory location has some unique index, i
 i
 (where 0≤i<N
 0
 i
 N
 ), that can be referenced as A[i]
 A
 i
 (you may also see it written as Ai
 A
 i
 ).
 
 Given an array, A
 A
 , of N
 N
 integers, print each element in reverse order as a single line of space-separated integers.
 
 Note: If you've already solved our C++ domain's Arrays Introduction challenge, you may want to skip this.
 
 Input Format
 
 The first line contains an integer, N
 N
 (the number of integers in A
 A
 ).
 The second line contains N
 N
 space-separated integers describing A
 A
 .
 
 Constraints
 
 1≤N≤103
 1
 N
 10
 3
 1≤Ai≤104, where Ai is the ith integer in A
 1
 A
 i
 10
 4
 , where
 A
 i
 is the
 i
 t
 h
 integer in
 A
 Output Format
 
 Print all N
 N
 integers in A
 A
 in reverse order as a single line of space-separated integers.
 
 Sample Input
 
 4
 1 4 3 2
 Sample Output
 
 2 3 4 1
 */
@interface NSArray (FGHRArrayDS)

- (NSArray *)reverse;

@end
