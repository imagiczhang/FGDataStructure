//
//  FGKLargestInNArrays.h
//  FGDataStructure
//
//  Created by Stephen Zhang on 7/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

//Find K-th largest element in N arrays.

@interface FGKLargestInNArrays : NSObject

+ (NSInteger)findKth:(NSUInteger)k inArrays:(NSArray<NSArray<NSNumber *> *> *)arrays;

@end

@interface Element : NSObject<NSCopying>

@property (nonatomic, readonly) NSInteger value;
@property (nonatomic, readonly) NSUInteger fromIndex;

- (instancetype)initWithValue:(NSInteger)value fromIndex:(NSUInteger)fromIndex NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;
- (BOOL)isEqualToElement:(Element *)element;

@end
