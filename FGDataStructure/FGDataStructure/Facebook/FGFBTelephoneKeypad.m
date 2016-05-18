//
//  FGFBTelephoneKeypad.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 18/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGFBTelephoneKeypad.h"

@implementation FGFBTelephoneKeypad

+ (NSArray *)allCombinations:(NSInteger)number {
    NSDictionary *keypadDict = @{@2: @[@"A", @"B", @"C"],
                                 @3: @[@"D", @"E", @"F"],
                                 @4: @[@"G", @"H", @"I"],
                                 @5: @[@"J", @"K", @"L"],
                                 @6: @[@"M", @"N", @"O"],
                                 @7: @[@"P", @"Q", @"R", @"S"],
                                 @8: @[@"T", @"U", @"V"],
                                 @9: @[@"W", @"X", @"Y", @"Z"]};
    
    NSMutableArray *arrays = [NSMutableArray array];
    while (number > 0) {
        NSInteger remaining = number % 10;
        if (remaining != 0 && remaining != 1) [arrays addObject:keypadDict[@(remaining)]];
        number = number / 10;
    }
    
    NSMutableArray *currentCombinations = [NSMutableArray array];
    [currentCombinations addObjectsFromArray:[arrays lastObject]];
    
    for (NSInteger i = arrays.count - 2; i >= 0; i--) {
        
        NSMutableArray *newCombination = [NSMutableArray array];
        
        for (NSInteger j = 0; j < currentCombinations.count; j++) {
            
            for (NSString *character in arrays[i]) {
                NSString *newWord = [NSString stringWithFormat:@"%@%@", currentCombinations[j], character];
                [newCombination addObject:newWord];
            }
        }
        
        [currentCombinations removeAllObjects];
        currentCombinations = newCombination;
    }
    
    return currentCombinations;
}

@end
