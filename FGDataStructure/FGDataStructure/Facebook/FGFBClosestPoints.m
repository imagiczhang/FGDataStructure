//
//  FGFBClosestPoints.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 15/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGFBClosestPoints.h"

@implementation FGFBClosestPoints

+ (NSArray<FGFBPoint *> *)closestPointsWith2DPoints:(NSArray<FGFBPoint *> *)points forK:(NSInteger)k type:(FGFBClosestPointsCalculatorType)type {
    if (type == FGFBClosestPointsCalculatorTypeSort) {
        return [self closestPointsWithSorting2DPoints:points forK:k];
    } else if (type == FGFBClosestPointsCalculatorTypeRecursive) {
        return [self closestPointsWithRecursive2DPoints:points forK:k];
    }
    
    return nil;
}

+ (NSArray<FGFBPoint *> *)closestPointsWithSorting2DPoints:(NSArray<FGFBPoint *> *)points forK:(NSInteger)k {
    
    // o(nlogn)
    NSArray *sortedPoints = [points sortedArrayUsingComparator:^(FGFBPoint *point1, FGFBPoint *point2) {
        float distance1 = sqrt(point1.x * point1.x + point1.y * point1.y);
        float distance2 = sqrt(point2.x * point2.x + point2.y * point2.y);
        
        if (distance1 > distance2) {
            return NSOrderedDescending;
        } else if (distance1 < distance2) {
            return NSOrderedAscending;
        } else {
            return NSOrderedSame;
        }
    }];
    
    // o(k)
    NSUInteger sortedCount = sortedPoints.count;
    NSMutableArray *closestArray = [NSMutableArray array];
    
    for (NSInteger i = 0; i < k; i++) {
        if (sortedCount > i) [closestArray addObject:sortedPoints[i]];
    }
    
    return closestArray;
}

+ (NSArray<FGFBPoint *> *)closestPointsWithRecursive2DPoints:(NSArray<FGFBPoint *> *)points forK:(NSInteger)k {
    NSMutableArray<FGFBPoint *> *newPoints = points.mutableCopy;
    
    // o(n*k)
    NSMutableArray<FGFBPoint *> *closestPoints = [NSMutableArray array];
    for (NSInteger i = 0; i < k; i++) {
        FGFBPoint *closestPoint;
        for (FGFBPoint *point in newPoints) {
            if (!closestPoint) {
                closestPoint = point;
            } else {
                float distance1 = sqrt(point.x * point.x + point.y * point.y);
                float distance2 = sqrt(closestPoint.x * closestPoint.x + closestPoint.y * closestPoint.y);
                
                if (distance1 < distance2) {
                    closestPoint = point;
                }
            }
            
        }
        
        [closestPoints addObject:closestPoint];
        
        // o(n)
        [newPoints removeObject:closestPoint];
    }
    
    return closestPoints;
}

@end

@implementation FGFBPoint

- (instancetype)initWithPointX:(NSInteger)pointX pointY:(NSInteger)pointY {
    if (self = [super init]) {
        _x = pointX;
        _y = pointY;
    }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    FGFBPoint *pointCopy = [[FGFBPoint allocWithZone:zone] init];
    
    pointCopy.x = _x;
    pointCopy.y = _y;
    
    return pointCopy;
}

@end
