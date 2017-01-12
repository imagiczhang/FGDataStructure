//
//  FGConnectingGraph.h
//  FGDataStructure
//
//  Created by Stephen Zhang on 12/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

//Given n nodes in a graph labeled from 1 to n. There is no edges in the graph at beginning.
//
//You need to support the following method:
//1. connect(a, b), add an edge to connect node a and node b. 2.query(a, b)`, check if two nodes are connected
//Example
//5 // n = 5
//query(1, 2) return false
//connect(1, 2)
//query(1, 3) return false
//connect(2, 4)
//query(1, 4) return true

@interface FGConnectingGraph : NSObject

- (instancetype)initWithN:(NSInteger)n NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;
- (void)connect:(NSInteger)a with:(NSInteger)b;
- (BOOL)query:(NSInteger)a with:(NSInteger)b;

@end
