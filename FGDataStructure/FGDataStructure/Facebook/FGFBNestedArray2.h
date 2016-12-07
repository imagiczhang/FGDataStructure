//
//  FGFBNestedArray2.h
//  FGDataStructure
//
//  Created by Stephen Zhang on 8/12/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Input: ["a", ["b", "c"], [["d", "e"], "f"]]
 *  nextobject Output:
 *  a, b, c, d, e, f
 */
@interface FGFBNestedArray2 : NSObject

@property (nonatomic, copy) NSArray *nestedArray;

- (instancetype)initWithNestedArray:(NSArray *)nestedArray;
- (NSString *)nextObject;

@end
