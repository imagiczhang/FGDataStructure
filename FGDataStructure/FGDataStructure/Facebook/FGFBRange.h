//
//  FGFBRange.h
//  FGDataStructure
//
//  Created by Stephen Zhang on 14/12/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

//Given two NSRange return whether the two ranges have intersection

@interface FGFBRange : NSObject

+ (BOOL)range:(NSRange)range1 hasInterSectionWithRange:(NSRange)range2;

@end
