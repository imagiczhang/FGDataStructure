//
//  FBFBWordsMatch.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 17/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  Given a dictionary of words, return an array of the words whose match. (i.e. pattern "c.t" match with "cat", "cut", etc. because the dot notation stand for ANY character).
 */
@interface FGFBWordsMatch : NSObject

+ (NSArray *)filterWordsByRegexFromArray:(NSArray *)words withPattern:(NSString *)pattern;
+ (NSArray *)filterWordsByPredicateFromArray:(NSArray *)words withPattern:(NSString *)pattern;

@end
