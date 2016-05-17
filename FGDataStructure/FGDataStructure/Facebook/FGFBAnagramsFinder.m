//
//  FGFBAnagramsFinder.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 17/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGFBAnagramsFinder.h"

@implementation FGFBAnagramsFinder

+ (BOOL)hasAnagramsByUsingSortFromArray:(NSArray *)words {
    NSMutableArray *sortedWords = [NSMutableArray array];
    
    for (NSString *word in words) {
        // o(n)
        NSArray *characters = [self separateCharacterFromWord:word];
        // o(nlogn)
        NSArray *sortedCharacters = [characters sortedArrayUsingComparator:^NSComparisonResult(NSString *stringA, NSString *stringB) {
            if ([stringA characterAtIndex:0] > [stringB characterAtIndex:0]) {
                return NSOrderedDescending;
            } else if ([stringA characterAtIndex:0] > [stringB characterAtIndex:0]) {
                return NSOrderedAscending;
            }
            
            return NSOrderedSame;
        }];
        
        // o(n)
        NSString *sortedWord = [sortedCharacters componentsJoinedByString:@""];
        [sortedWords addObject:sortedWord];
    }
    
    NSSet *sortedWordsSet = [NSSet setWithArray:sortedWords];
    
    return (sortedWordsSet.count != sortedWords.count);

}

+ (NSArray *)separateCharacterFromWord:(NSString *)word {
    NSMutableArray *characterArray = [NSMutableArray array];
    [word enumerateSubstringsInRange:NSMakeRange(0, [word length])
                                options:(NSStringEnumerationByComposedCharacterSequences)
                             usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                 [characterArray addObject:substring];
                             }];
    
    return characterArray;
    
}

@end
