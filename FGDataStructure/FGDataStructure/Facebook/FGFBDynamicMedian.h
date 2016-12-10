//
//  FGFBDynamicMedian.h
//  FGDataStructure
//
//  Created by Stephen Zhang on 9/12/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

//Create the data structure for a component that will receive a series of numbers over the time and, when asked, returns the median of all received elements.
//
//(Median: the numerical value separating the higher half of a data sample from the lower half. Example: if the series is
// 
// 2, 7, 4, 9, 1, 5, 8, 3, 6
// 
// then the median is 5.)
//
//Model the data structure for a component that would have these two methods:
//
//
//@interface SampleHandler {
//    - (void)addNumber:(NSNumber*)number;
//    - (NSNumber*)median;
//}
//Justify your decisions. Calculate the complexity of each method.

@interface FGFBDynamicMedian : NSObject

- (void)addNumber:(NSNumber *)number;
- (NSNumber *)median;

@end
