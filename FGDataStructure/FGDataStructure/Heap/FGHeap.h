//
//  FGHeap.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 27/04/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Use NSMutableArray to resolve heap
 */
@interface FGHeap : NSObject

- (void)insertNumber:(NSNumber *)number;
- (NSNumber *)deleteMin;

@end
