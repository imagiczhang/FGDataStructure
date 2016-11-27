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

+ (NSArray *)arrayByQuickMovingZeroWithNumbers:(NSArray *)numbers
{
    NSMutableArray *array = [numbers mutableCopy];
    NSUInteger i = 0;
    NSUInteger j = array.count - 1;
    while ( i < j) {
        while (i < j && [array[i] integerValue] == 0) {
            i++;
        }
        while (i < j && [array[j] integerValue] != 0) {
            j--;
        }
        
        if (i < j) {
            [array exchangeObjectAtIndex:i withObjectAtIndex:j];
        }
    }
    return [array copy];
}

+ (NSArray *)removeDuplicatedWords:(NSArray *)words preserveOrder:(BOOL)preserveOrder
{
    if (preserveOrder) {
        NSOrderedSet *orderedSet = [NSOrderedSet orderedSetWithArray:words];
        return [orderedSet array];
    } else {
        NSSet *set = [[NSSet alloc] initWithArray:words];
        return [set allObjects];
    }
}


+ (BOOL)hasSumOf3IntsFromArray:(NSArray *)array target:(NSInteger)target
{
    NSArray *sortedArray = [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSNumber *num1 = obj1;
        NSNumber *num2 = obj2;
        return [num1 compare:num2];
    }];
    
    for (NSUInteger i = 0; i < sortedArray.count; i++) {
        NSNumber *num = sortedArray[i];
        if ([self hasSumOf2IntsFromSortedArray:sortedArray target:target-[num integerValue] start:i+1 end:sortedArray.count-1]) {
            return YES;
        }
    }
    
    return NO;
}

+ (BOOL)hasSumOf2IntsFromSortedArray:(NSArray *)array target:(NSInteger)target start:(NSUInteger)start end:(NSUInteger)end
{
    NSUInteger i = start;
    NSUInteger j = end;
    
    while ( i < j) {
        NSInteger sum = [array[i] integerValue] + [array[j] integerValue];
        if ( sum == target) {
            return YES;
        } else if ( sum > target) {
            j--;
        } else if ( sum < target) {
            i++;
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

+ (NSString *)countConsecutiveNumbersFromString:(NSString *)string
{
    NSUInteger length = string.length;
    NSUInteger i = 0;
    NSMutableString *mutableString = [[NSMutableString alloc] init];
    while (i < length) {
        unichar num = [string characterAtIndex:i];
        NSUInteger end = [self searchConsecutiveChar:num fromString:string withStart:i];
        if (end != NSUIntegerMax && end >= i) {
            [mutableString appendFormat:@"%ld%c", end-i+1, num];
            i = end + 1;
        } else {
            i++;
        }
    }
    return [mutableString copy];
}

+ (NSUInteger)searchConsecutiveChar:(unichar)character fromString:(NSString *)string withStart:(NSUInteger)start
{
    NSUInteger j = start;
    NSUInteger length = string.length;
    while ( j < length) {
        if (character == [string characterAtIndex:j]) {
            j++;
        } else {
            if ( j > 0) {
                return j - 1;
            } else {
                return NSUIntegerMax;
            }
        }
    }
    return length - 1;
}

+ (NSInteger)findLongestSubstringInString:(NSString *)string
{
    //build the lastAppearanceIndex
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    NSMutableArray *lastAppearanceIndex = [NSMutableArray array];
    
    [string enumerateSubstringsInRange:NSMakeRange(0, string.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        if (substring) {
            if (dict[substring]) {
                [lastAppearanceIndex addObject:dict[substring]];
            } else {
                [lastAppearanceIndex addObject:@(NSUIntegerMax)];
            }
            dict[substring] = @(substringRange.location);
        }
    }];
    
    //traverse strign with help of lastAppearanceIndex
    __block NSUInteger longestSubstringLength = 0;
    __block NSUInteger currentStart = 0;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, string.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        if (substring) {
            NSUInteger current = substringRange.location;
            NSUInteger lastAppearance = [lastAppearanceIndex[current] unsignedIntegerValue];
            if (lastAppearance != NSUIntegerMax) {
                currentStart = currentStart > lastAppearance ? currentStart : lastAppearance + 1;
            }
            
            NSUInteger currentLength= current - currentStart + 1;
            
            longestSubstringLength = currentLength > longestSubstringLength ? currentLength : longestSubstringLength;
        }
    }];
    
    return longestSubstringLength;
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


+ (NSInteger)simpleQuickBinaryNumber1:(NSInteger)binary1 addBinaryNumber2:(NSInteger)binary2
{
    NSInteger binarySum = binary1 + binary2;
    NSMutableString *result = [[NSMutableString alloc] init];
    while (binarySum > 0) {
        NSInteger remainder = binarySum % 10;
        
        [result insertString:[NSString stringWithFormat:@"%ld", remainder%2] atIndex:0];
        
        binarySum = binarySum/10 + remainder/2;
    }
    
    if (result.length > 0) {
        return [result integerValue];
    }
    
    return 0;
}

+ (NSDictionary *)dictionaryFromFilename:(NSString *)fileName {
    NSString *fileNameString = [[fileName componentsSeparatedByString:@"."] firstObject];
    NSArray *fileNames = [fileNameString componentsSeparatedByString:@"_"];
    
    NSMutableDictionary *nameDictionary = [NSMutableDictionary dictionaryWithCapacity:fileNames.count];
    
    for (NSString *name in fileNames) {
        if ([name isEqualToString:@"johndoe"]) {
            nameDictionary[@"NAME"] = @"johndoe";
        } else {
            NSString *key = [name substringWithRange:NSMakeRange(0, 1)];
            NSString *value = [name substringFromIndex:1];
            if (key && value) {
                [nameDictionary setObject:value forKey:key];
            }
        }
    }
    
    return nameDictionary.copy;
    
}

+ (NSString *)longestConsecutiveCharacterFromString:(NSString *)string {
    if (string.length == 0) return nil;
    
    NSString *result = @"";
    NSInteger max = 1;
    NSInteger count = 1;
    NSString *previousCharacter = @"";
    
    for (NSInteger i = 0; i < string.length; i++) {
        NSString *currentCharacter = [string substringWithRange:NSMakeRange(i, 1)];
        
        if ([currentCharacter isEqualToString:previousCharacter]) {
            count++;
            
            if (count > max) {
                max = count;
                result = currentCharacter;
            } else if (count == max) {
                result = [NSString stringWithFormat:@"%@%@", result, currentCharacter];
            }
        } else {
            if (max == 1 && ![currentCharacter isEqualToString:@" "]) {
                result = [NSString stringWithFormat:@"%@%@", result, currentCharacter];
            }
            count = 1;
        }
        
        previousCharacter = currentCharacter;
    }
    
    return result;
}

// It is not the best solution but it can deal with string like @"thi iis" -> @"i"
+ (NSString *)anotherLongestConsecutiveCharacterFromString:(NSString *)string
{
    NSString *input = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSUInteger longestLength = 0;
    for (NSInteger i = 0; i < string.length;) {
        NSUInteger consecutiveLength = [self searchForConsecutiveLengthWithString:input from:i];
        if (consecutiveLength > longestLength) {
            longestLength = consecutiveLength;
        }
        
        if (consecutiveLength > 0) {
            i += consecutiveLength;
        } else {
            i++;
        }
    }
    
    if (longestLength <= 1) {
        return input;
    } else {
        NSMutableString *result = [[NSMutableString alloc] init];
        for (NSInteger i = 0; i < string.length;) {
            NSUInteger consecutiveLength = [self searchForConsecutiveLengthWithString:input from:i];
            if (consecutiveLength == longestLength) {
                [result appendFormat:@"%@", [input substringWithRange:NSMakeRange(i, 1)]];
            }
            
            if (consecutiveLength > 0) {
                i += consecutiveLength;
            } else {
                i++;
            }
        }
        return [result copy];
    }
}

+ (NSUInteger)searchForConsecutiveLengthWithString:(NSString *)input from:(NSInteger)start
{
    NSAssert(start >= 0, @"start should be greater than or equal to 0");
    unichar character = [input characterAtIndex:start];
    NSUInteger result = 1;
    for (NSInteger i = start + 1; i < input.length; i++) {
        if (character == [input characterAtIndex:i]) {
            result++;
        } else {
            break;
        }
    }
    
    return result;
}

+ (BOOL)isValidPalindromeFromString:(NSString *)string {
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:@"[^A-Za-z0-9]" options:0 error:nil];
    NSString *filteredString = [[regularExpression stringByReplacingMatchesInString:string options:0 range:NSMakeRange(0, string.length) withTemplate:@""] lowercaseString];
    
    NSUInteger i = 0;
    NSUInteger j = filteredString.length - 1;
    while (i < j) {
        if ([filteredString characterAtIndex:i] == [filteredString characterAtIndex:j]) {
            i++;
            j--;
        } else {
            return NO;
        }
    }
    
    return YES;
}

+ (NSArray *)sortColour:(NSArray *)colours {
    NSMutableArray *copyedColours = colours.mutableCopy;
    NSInteger redIndex = 0;
    NSInteger blueIndex = colours.count - 1;
    NSInteger i = 0;
    while (i < blueIndex+1) {
        if([copyedColours[i] isEqualToNumber:@0]) {
            [copyedColours exchangeObjectAtIndex:i withObjectAtIndex:redIndex];
            redIndex++;
            i++;
        } else if ([copyedColours[i] isEqualToNumber:@2]) {
            [copyedColours exchangeObjectAtIndex:i withObjectAtIndex:blueIndex];
            blueIndex--;
        } else {
            i++;
        }
    }
    return copyedColours.copy;
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
