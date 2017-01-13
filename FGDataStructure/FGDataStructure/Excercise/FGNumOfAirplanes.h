//
//  FGNumOfAirplanes.h
//  FGDataStructure
//
//  Created by Stephen Zhang on 13/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

//Given an interval list which are flying and landing time of the flight. How many airplanes are on the sky at most?
//
//Notice
//
//If landing and flying happens at the same time, we consider landing should happen at first.
//
//Example
//For interval list
//
//[
// [1,10],
// [2,3],
// [5,8],
// [4,7]
// ]
//Return 3

@interface FGNumOfAirplanes : NSObject

+ (NSInteger)maxPlanesInSkyWithFlightList:(NSArray<NSArray<NSNumber *> *> *)flightList;

@end

@interface FGFlightEvent : NSObject<NSCopying>

@property (nonatomic, readonly) NSInteger time;
@property (nonatomic, readonly) BOOL isTakingOff;

- (instancetype)initWithTime:(NSInteger)time isTakingOff:(BOOL)isTakingOff NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;

@end
