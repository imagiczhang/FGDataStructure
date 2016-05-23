//
//  FGGGNumberGroup.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 16/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  [1,2,3,5,6,8,9,10]
 *  [[1,2,3], [5,6], [8,9,10]]
 *  1-3. 5-6, 8-10
 */
@interface FGGGNumberGroup : NSObject

+ (NSArray *)numberGroupFromNumbers:(NSArray *)numbers;

@end
