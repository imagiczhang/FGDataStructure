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
    } else if (type == FGFBClosestPointsCalculatorTypeQuickSelect) {
        return [self closestPointsWithQuickSelect2DPoints:points forK:k];
    }
    
    return nil;
}

#pragma mark - Quick select
+ (NSArray<FGFBPoint *> *)closestPointsWithQuickSelect2DPoints:(NSArray<FGFBPoint *> *)points forK:(NSInteger)k
{
    if (k >= points.count) {
        return points;
    }
    
    NSMutableArray<FGFBPoint *> *mutablePoints = points.mutableCopy;
    
    [self quickSelectPoints:mutablePoints start:0 end:points.count - 1 forK:k];
    return [mutablePoints subarrayWithRange:NSMakeRange(0, k)];
}

+ (void)quickSelectPoints:(NSMutableArray<FGFBPoint *> *)points start:(NSUInteger)start end:(NSUInteger)end forK:(NSInteger)k
{
    if (start >= end) {
        return;
    }
    NSRange range = [self partitionPoints:points start:start end:end];
    if (range.location <= k-1 && range.location + range.length -1 >= k-1) {
        return;
    } else if (range.location > k-1) {
        [self quickSelectPoints:points start:start end:range.location-1 forK:k];
    } else {
        [self quickSelectPoints:points start:range.location+range.length end:end forK:k];
    }
}

#pragma mark - Recursive
//This method is suitable for when k is a small constant number
+ (NSArray<FGFBPoint *> *)closestPointsWithRecursive2DPoints:(NSArray<FGFBPoint *> *)points forK:(NSInteger)k
{
    if (k >= points.count) {
        return points;
    }
    
    NSMutableArray<FGFBPoint *> *result = [NSMutableArray array];
    
    for (FGFBPoint *point in points) {
        [self insertPoint:point intoSortedArray:result];
        if (result.count > k) {
            [result removeLastObject];
        }
    }
    return [result copy];
}

+ (void)insertPoint:(FGFBPoint *)point intoSortedArray:(NSMutableArray<FGFBPoint *> *)points {
    int index = 0;
    for (FGFBPoint *currentPoint in points) {
        if ([self comparePoint:point withPoint:currentPoint] != NSOrderedDescending){
            [points insertObject:point atIndex:index];
            return;
        }
        index++;
    }
    [points addObject:point];
}

#pragma mark - Quick Sort

+ (NSArray<FGFBPoint *> *)closestPointsWithSorting2DPoints:(NSArray<FGFBPoint *> *)points forK:(NSInteger)k
{
    NSMutableArray<FGFBPoint *> *mutablePoints = points.mutableCopy;
    NSUInteger i = mutablePoints.count - 1;
    while (i > 0) {
        NSUInteger random = arc4random_uniform(i+1);
        [mutablePoints exchangeObjectAtIndex:i withObjectAtIndex:random];
        i--;
    }
    
    [self sortPoints:mutablePoints start:0 end:mutablePoints.count - 1];
    
    if ( k >= mutablePoints.count) {
        return [mutablePoints copy];
    } else {
        return [mutablePoints subarrayWithRange:NSMakeRange(0, k)];
    }
}

+ (void)sortPoints:(NSMutableArray<FGFBPoint *> *)points start:(NSInteger)start end:(NSInteger)end
{
    if(start < end) {
        NSRange pivotRange = [self partitionPoints:points start:start end:end];
        [self sortPoints:points start:start end:pivotRange.location-1];
        [self sortPoints:points start:pivotRange.location + pivotRange.length end:end];
    }
}

+ (NSRange)partitionPoints:(NSMutableArray<FGFBPoint *> *)points start:(NSUInteger)start end:(NSUInteger)end
{
    NSUInteger i = start;
    NSUInteger lt = start;
    NSUInteger gt = end;
    FGFBPoint *pivot = [points objectAtIndex:end];
    
    while (i <= gt) {
        switch ([self comparePoint:[points objectAtIndex:i] withPoint:pivot]) {
            case NSOrderedAscending:
                [points exchangeObjectAtIndex:lt withObjectAtIndex:i];
                lt++;
                i++;
                break;
            case NSOrderedDescending:
                [points exchangeObjectAtIndex:gt withObjectAtIndex:i];
                gt--;
                break;
            case NSOrderedSame:
                i++;
                break;
        }
    }
    
    return NSMakeRange(lt, gt - lt + 1);
}

+ (NSComparisonResult)comparePoint:(FGFBPoint *)point1 withPoint:(FGFBPoint *)point2 {
    NSInteger distance1 = point1.x * point1.x + point1.y * point1.y;
    NSInteger distance2 = point2.x * point2.x + point2.y * point2.y;
    if (distance1 < distance2) {
        return NSOrderedAscending;
    } else if (distance1 > distance2) {
        return NSOrderedDescending;
    } else {
        return NSOrderedSame;
    }
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
