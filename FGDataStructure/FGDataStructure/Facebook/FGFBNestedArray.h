//
//  FGFBNestedArray.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 16/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Input: ["a", ["b", "c"], [["d", "e"], "f"]]
 *  nextobject Output:
 *  a, b, c, d, e, f
 */
@interface FGFBNestedArray : NSObject

@property (nonatomic, copy) NSArray *nestedArray;

- (instancetype)initWithNestedArray:(NSArray *)nestedArray;
- (NSString *)nextObject;

@end
