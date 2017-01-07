//
//  FGFBClosestPoints.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 15/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, FGFBClosestPointsCalculatorType) {
    FGFBClosestPointsCalculatorTypeSort,
    FGFBClosestPointsCalculatorTypeQuickSelect,
    FGFBClosestPointsCalculatorTypeRecursive
};

@class FGFBPoint;

/**
 *  Given a set of 2D points and an integer k,
 *  find the k points closest to the origin, (0,0).
 *  - TODO: Future work:
 *  - Used struct
 *  - Used dynamic origin point
 *
 */

@interface FGFBClosestPoints : NSObject

/**
 *  This algorithm is to calculate closest points by using sorting or recursive
 *
 *  @param points Array of `FGFBPoint`
 *  @param k      The number of closest points
 *  @param type   `FGFBClosestPointsCalculatorType` calculator algorithm type
 *
 *  @return An array of the closest k points
 */
+ (NSArray<FGFBPoint *> *)closestPointsWith2DPoints:(NSArray<FGFBPoint *> *)points forK:(NSInteger)k type:(FGFBClosestPointsCalculatorType)type;


@end

@interface FGFBPoint : NSObject <NSCopying>

- (instancetype)initWithPointX:(NSInteger)pointX pointY:(NSInteger)pointY;

@property (nonatomic, assign) NSInteger x;
@property (nonatomic, assign) NSInteger y;

@end
