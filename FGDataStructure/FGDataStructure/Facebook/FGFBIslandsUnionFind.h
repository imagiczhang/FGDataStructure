//
//  FGFBIslandsUnionFind.h
//  FGDataStructure
//
//  Created by Stephen Zhang on 8/12/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FGFBUnionFind: NSObject

@property (nonatomic) NSUInteger countOfUnions;

- (void)addNode:(NSUInteger)nodeNumber;
- (void)connectNode:(NSUInteger)node1 withNode:(NSUInteger)node2;
- (NSUInteger)rootOfNode:(NSUInteger)node;

@end

@interface FGFBIslandsUnionFind : NSObject

+ (NSUInteger)countOfIslandsInMap:(NSArray<NSArray<NSString *> *> *)map;

@end
