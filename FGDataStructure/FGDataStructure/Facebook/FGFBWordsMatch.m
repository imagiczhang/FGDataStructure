//
//  FBFBWordsMatch.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 17/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGFBWordsMatch.h"

@implementation FGFBWordsMatch

+ (NSArray<NSString *> *)filterWordsByRegexFromArray:(NSArray<NSString *> *)words withPattern:(NSString *)pattern {
    NSMutableArray *filteredWords = [NSMutableArray array];
    
    for (NSString *word in words) {
        NSError *error = nil;
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
        if ([regex firstMatchInString:word options:0 range:NSMakeRange(0, word.length)]) {
            [filteredWords addObject:word];
        }
    }
    
    return [filteredWords copy];
}

+ (NSArray<NSString *> *)filterWordsByPredicateFromArray:(NSArray<NSString *> *)words withPattern:(NSString *)pattern {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches[c] %@", pattern];
    return [words filteredArrayUsingPredicate:predicate];
}

@end
