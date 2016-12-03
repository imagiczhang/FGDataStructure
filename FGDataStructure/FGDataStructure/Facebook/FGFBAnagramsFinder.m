//
//  FGFBAnagramsFinder.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 17/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGFBAnagramsFinder.h"

// Assume there are n words in the array and average word length is l
// The time complexity of this solution is O(nl*logl)

@implementation FGFBAnagramsFinder

+ (BOOL)hasAnagramsByUsingSortFromArray:(NSArray *)words
{
    NSMutableSet *set = [[NSMutableSet alloc] init];
    
    for (NSString *word in words) {
        NSArray *sortedCharacters = [self sortedCharactersForWord:word];
        if (sortedCharacters) {
            if ([set containsObject:sortedCharacters]) {
                return YES;
            } else {
                [set addObject:sortedCharacters];
            }
        }
    }
    return NO;
}

+ (NSArray *)sortedCharactersForWord:(NSString *)word
{
    NSArray<NSString *> *characters = [self charactersForWord:word];
    
    if (characters.count > 0) {
        
        NSArray *sorted = [characters sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            unichar char1 = [(NSString *)obj1 characterAtIndex:0];
            unichar char2 = [(NSString *)obj2 characterAtIndex:0];
            if (char1 < char2) {
                return NSOrderedAscending;
            } else if (char1 > char2) {
                return NSOrderedDescending;
            }
            return NSOrderedSame;
        }];
        
        return sorted;
    }
    return nil;
}

+ (NSArray<NSString *> *)charactersForWord:(NSString *)word
{
    NSMutableArray<NSString *> *characters = [[NSMutableArray alloc] init];
    
    [[word lowercaseString] enumerateSubstringsInRange:NSMakeRange(0, word.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        if (substring) {
            [characters addObject:substring];
        }
    }];
    
    return [characters copy];
}

+ (BOOL)hasAnagramsByUsingHashFromArray:(NSArray<NSString *> *)words;
{
    NSMutableSet<NSNumber *> *hashSet = [NSMutableSet set];
    
    for (NSString *word in words) {
        if ([hashSet containsObject:@([self hashForWord:word])]) {
            return YES;
        } else {
            [hashSet addObject:@([self hashForWord:word])];
        }
    }
    return NO;
}

+ (NSUInteger)hashForWord:(NSString *)word
{
    unichar hash = 0;
    
    for (int i = 0; i < word.length; i++) {
        hash = hash ^ [word characterAtIndex:i];
    }
    
    return (NSUInteger)hash;
}

@end
