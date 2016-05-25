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
    
    // o(n^2)
    NSMutableArray *newNumbers = numbers.mutableCopy;
    [newNumbers removeObject:@0];
    
    // o(n)
    for (NSInteger i = 0; i < numberOfZero; i++) {
        [newNumbers addObject:@0];
    }
    
    return newNumbers;
}


+ (NSArray *)arrayByQuickMovingZeroWithNumbers:(NSArray *)numbers {
    NSMutableArray *mutableNumbers = [numbers mutableCopy];
    NSInteger zeroIndex = numbers.count - 1;
    
    for (NSInteger count = 0; count < mutableNumbers.count; count++) {
        while ([mutableNumbers[zeroIndex] isEqualToNumber:@0] && zeroIndex > count) {
            zeroIndex--;
        }
        
        if (count >= zeroIndex) break;
        
        if ([mutableNumbers[count] isEqualToNumber:@0]) {
            [mutableNumbers exchangeObjectAtIndex:count withObjectAtIndex:zeroIndex];
        }
    }
    
    return [mutableNumbers copy]
    ;
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

+ (NSInteger)findLongestSubstringInString:(NSString *)string {
    NSInteger longestLength = 0;
    for (NSInteger i = 0; i < string.length; i++) {
        NSInteger currentLength = 0;
        NSMutableDictionary *currentDictionary = [NSMutableDictionary dictionary];
        while (YES) {
            if ((i + currentLength) == string.length) break;
            NSString *currentCharacter = [string substringWithRange:NSMakeRange(i + currentLength, 1)];
            if ([currentDictionary objectForKey:currentCharacter]) {
                if (currentLength > longestLength) {
                    longestLength = currentLength;
                }
                break;
            } else {
                [currentDictionary setObject:@0 forKey:currentCharacter];
                currentLength++;
            }
            
        }
    }
    
    return longestLength;
}

+ (NSInteger)binaryNumber1:(NSInteger)binary1 addBinaryNumber2:(NSInteger)binary2 {
    NSInteger decimal1 = [self decimalFromBinary:binary1];
    NSInteger decimal2 = [self decimalFromBinary:binary2];
    
    return [self binaryFromDecimal:decimal1 + decimal2];
}

+ (NSInteger)quickBinaryNumber1:(NSInteger)binary1 addBinaryNumber2:(NSInteger)binary2 {
    NSString *result = @"";
    NSInteger currentExtra = 0;
    NSInteger previousExra = 0;
    while (binary1 > 0 || binary2 > 0 || previousExra > 0) {
        NSInteger remaining1 = 0;
        NSInteger remaining2 = 0;
        
        if (binary1 > 0) {
            remaining1 = binary1 % 10;
            binary1 = binary1 / 10;
        }
        
        if (binary2 > 0) {
            remaining2 = binary2 % 10;
            binary2 = binary2 / 10;
        }
        
        NSInteger currentSum = remaining1 + remaining2 + previousExra;
        if (currentSum >= 2) {
            currentSum = currentSum % 2;
            currentExtra = 1;
        } else {
            currentExtra = 0;
        }
        
        result = [NSString stringWithFormat:@"%ld%@", currentSum, result];
        previousExra = currentExtra;
        currentExtra = 0;
    }
    
    return [result integerValue];
    
}

+ (NSDictionary *)dictionaryFromFilename:(NSString *)fileName {
    NSString *fileNameString = [[fileName componentsSeparatedByString:@"."] firstObject];
    NSArray *fileNames = [fileNameString componentsSeparatedByString:@"_"];
    
    NSMutableDictionary *nameDictionary = [NSMutableDictionary dictionaryWithCapacity:fileNames.count];
    
    for (NSString *name in fileNames) {
        if ([name isEqualToString:@"johndoe"]) {
            nameDictionary[@"NAME"] = @"johndoe";
        } else {
            [nameDictionary setObject:[name substringFromIndex:1] forKey:[name substringWithRange:NSMakeRange(0, 1)]];
        }
    }
    
    return nameDictionary.copy;
    
}

#pragma mark - Private
+ (NSInteger)decimalFromBinary:(NSInteger)binary {
    NSInteger result = 0;
    NSInteger count = 0;
    while (binary > 0) {
        NSInteger remaining = binary % 10;
        if (remaining == 1) result = pow(2, count) + result;
        binary = binary / 10;
        
        count++;
    }
    
    return result;
}

+ (NSInteger)binaryFromDecimal:(NSInteger)decimal {
    NSString *result = @"";
    while (decimal > 1) {
        result = [NSString stringWithFormat:@"%ld%@", decimal % 2, result];
        decimal = decimal / 2;
    }
    
    result = [NSString stringWithFormat:@"%ld%@", decimal, result];
    
    return [result integerValue];
}

@end
