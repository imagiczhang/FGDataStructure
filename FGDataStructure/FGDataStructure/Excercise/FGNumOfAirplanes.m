//
//  FGNumOfAirplanes.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 13/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import "FGNumOfAirplanes.h"
#import "FGHashHeap.h"

@implementation FGFlightEvent

- (instancetype)initWithTime:(NSInteger)time isTakingOff:(BOOL)isTakingOff
{
    if (self = [super init]) {
        _time = time;
        _isTakingOff = isTakingOff;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

@end

@implementation FGNumOfAirplanes

+ (NSInteger)maxPlanesInSkyWithFlightList:(NSArray<NSArray<NSNumber *> *> *)flightList
{
    FGHashHeap<FGFlightEvent *> *minHeap = [[FGHashHeap alloc] initWithComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        FGFlightEvent *event1 = obj1;
        FGFlightEvent *event2 = obj2;
        
        if (event1.time < event2.time) {
            return NSOrderedAscending;
        } else if (event1.time > event2.time) {
            return NSOrderedDescending;
        } else {
            if (event1.isTakingOff == event2.isTakingOff) {
                return NSOrderedSame;
            } else if (event1.isTakingOff) {
                return NSOrderedDescending;
            } else  {
                return NSOrderedAscending;
            }
        }
    }];
    
    for (NSArray<NSNumber *> *flight in flightList) {
        [minHeap addItem:[[FGFlightEvent alloc] initWithTime:flight[0].integerValue isTakingOff:YES]];
        [minHeap addItem:[[FGFlightEvent alloc] initWithTime:flight[1].integerValue isTakingOff:NO]];
    }
    
    NSInteger flightsCount = 0;
    NSInteger maxCount = 0;
    
    while ([minHeap peek]) {
        FGFlightEvent *event = [minHeap poll];
        if (event.isTakingOff) {
            flightsCount++;
        } else {
            flightsCount--;
        }
        
        maxCount = MAX(maxCount, flightsCount);
    }
    
    return maxCount;
}

@end
