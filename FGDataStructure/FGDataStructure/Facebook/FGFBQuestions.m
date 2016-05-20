//
//  FGFBQuestions.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 15/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGFBQuestions.h"

@implementation FGFBQuestions

+ (NSArray *)arrayByMovingZeroWithNumbers:(NSArray *)numbers {
    // o(n)
    NSInteger numberOfZero = 0;
    for (NSNumber *number in numbers) {
        if ([number isEqual:@0]) {
            numberOfZero++;
        }
    }
    
    // o(n)
    NSMutableArray *newNumbers = numbers.mutableCopy;
    [newNumbers removeObject:@0];
    
    // o(n)
    for (NSInteger i = 0; i < numberOfZero; i++) {
        [newNumbers addObject:@0];
    }
    
    return newNumbers;
}

+ (NSArray *)removeDuplicatedWords:(NSArray *)words perserveOrder:(BOOL)perserveOrder {
    if (perserveOrder) {
        NSOrderedSet *wordsSet = [NSOrderedSet orderedSetWithArray:words];
        return [wordsSet array];
    } else {
        NSSet *wordsSet = [NSSet setWithArray:words];
        return [wordsSet allObjects];
    }

}

+ (BOOL)hasSumOf3IntsFromArray:(NSArray *)array target:(NSInteger)target {
    NSArray *sortedArray = [array sortedArrayUsingComparator:^NSComparisonResult(NSNumber *number1, NSNumber *number2) {
        return [number1 compare:number2];
    }];
    
    for (NSInteger i = 0; i < sortedArray.count; i++) {
        NSInteger leftIndex = i + 1;
        NSInteger rightIndex = sortedArray.count - 1;

        while (leftIndex < rightIndex) {
            NSInteger currentValue = [sortedArray[i] integerValue];
            NSInteger leftValue = [sortedArray[leftIndex] integerValue];
            NSInteger rightValue = [sortedArray[rightIndex] integerValue];
            
            NSInteger sum = currentValue + leftValue + rightValue;
            
            if (sum == target) return YES;
            
            if (sum > target) rightIndex--;
            if (sum < target) leftIndex++;
        }
    }
            
    return NO;
}
//1122344
+ (NSArray *)countNumbersFromString:(NSString *)string numberOfRecursives:(NSInteger)numberOfRecursives {
    NSMutableArray *strings = [NSMutableArray arrayWithCapacity:numberOfRecursives];
    NSString *previousString = string;
    for (NSInteger i = 0; i < numberOfRecursives; i++) {
        NSString *newString = @"";
        NSString *currentCharacter = @"";
        NSString *previousCharacter = [previousString substringWithRange:NSMakeRange(0, 1)];;
        NSInteger count = 1;
        for (NSInteger j = 1; j < previousString.length; j++) {
            currentCharacter = [previousString substringWithRange:NSMakeRange(j, 1)];
            if ([currentCharacter isEqualToString:previousCharacter]) {
                count++;
            } else {
                newString = [NSString stringWithFormat:@"%@%ld%@", newString, (long)count, previousCharacter];
                count = 1;
            }
            
            previousCharacter = currentCharacter;
        }
        
        newString = [NSString stringWithFormat:@"%@%ld%@", newString, (long)count, previousCharacter];
        
        previousString = newString;
        [strings addObject:newString];
    }
    
    return [strings copy];
}

@end
