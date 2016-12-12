//
//  FGQuickSort.h
//  FGDataStructure
//
//  Created by Stephen Zhang on 12/12/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, FGQuickSortPartitionType) {
    FGQuickSortPartitionTypeLomuto,
    FGQuickSortPartitionTypeHoare,
    FGQuickSortPartitionType3Way,
    FGQuickSortPartitionTypeDualPivot
};

@interface FGQuickSort : NSObject

+ (NSArray<NSNumber *> *)sortArray:(NSArray<NSNumber *> *)array partitionType:(FGQuickSortPartitionType)partitionType;

@end
