//
//  FindKthInSortedMatrix.h
//  FGDataStructure
//
//  Created by Stephen Zhang on 8/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

//Find the kth smallest number in at row and column sorted matrix.
//
//Example
//Given k = 4 and a matrix:
//
//[
// [1 ,5 ,7],
// [3 ,7 ,8],
// [4 ,8 ,9],
// ]
//return 5

@interface FindKthInSortedMatrix : NSObject

+ (NSInteger)findKth:(NSInteger)k inMatrix:(NSArray<NSArray<NSNumber *> *> *)matrix;

@end

@interface MatrixElement : NSObject <NSCopying>

@property (nonatomic, readonly) NSInteger value;
@property (nonatomic, readonly) NSInteger x;
@property (nonatomic, readonly) NSInteger y;

- (instancetype)initWithValue:(NSInteger)value x:(NSInteger)x y:(NSInteger)y NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;

@end
