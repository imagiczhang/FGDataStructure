//
//  FGHeap2.h
//  FGDataStructure
//
//  Created by Stephen Zhang on 6/12/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FGHashHeap<__covariant ObjectType: id<NSCopying>> : NSObject

- (instancetype)initWithComparator:(NSComparator)comparator;
- (void)addItem:(ObjectType)item;
- (BOOL)deleteItem:(ObjectType)item;
- (nullable ObjectType)peek;
- (nullable ObjectType)poll;

@property (nonatomic, readonly) NSInteger itemsCount;

@end

NS_ASSUME_NONNULL_END
