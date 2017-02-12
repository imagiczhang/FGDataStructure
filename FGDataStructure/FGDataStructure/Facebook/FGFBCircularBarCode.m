//
//  FGFBCircularBarCode.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 7/02/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import "FGFBCircularBarCode.h"

@implementation FGFBCircularBarCode

+ (NSArray<NSString *> *)drawBarcodeWithCode:(NSString *)code
{
    if (!code || code.length == 0) {
        return nil;
    }
    
    NSInteger currentStart = -1;
    NSMutableArray<NSString *> *result = [NSMutableArray array];
    NSInteger i = 0;
    for (; i < code.length; i++) {
        NSString *current = [code substringWithRange:NSMakeRange(i, 1)];
        if ([current isEqualToString:@"1"]) {
            if (currentStart == -1) {
                currentStart = i;
            }
        } else {
            if (currentStart != -1) {
//                drawAt(currentStart, i - currentStart - 1);
                [result addObject:[NSString stringWithFormat:@"drawAt(%ld, %ld)", (long)currentStart, (long)i-currentStart-1]];
                currentStart = -1;
            }
        }
    }
    if (currentStart != -1) {
//        drawAt(currentStart, i - currentStart - 1);
        [result addObject:[NSString stringWithFormat:@"drawAt(%ld, %ld)", (long)currentStart, (long)i-currentStart-1]];
        currentStart = -1;
    }
    return [result copy];
}

+ (NSArray<NSString *> *)drawCircularBarcodeWithCode:(NSString *)code
{
    if (!code || code.length == 0) {
        return nil;
    }
    
    NSInteger searchStart = -1;
    NSInteger currentStart = -1;
    NSMutableArray<NSString *> *result = [NSMutableArray array];
    for (NSInteger i = 0; i < code.length; i++) {
        if ([[code substringWithRange:NSMakeRange(i, 1)] isEqualToString:@"0"]) {
            searchStart = i;
            break;
        }
    }
    
    if (searchStart == -1) {
        //drawAt(0, code.length)
        [result addObject:[NSString stringWithFormat:@"drawAt(0, %ld)", (unsigned long)code.length]];
        return result;
    }
    
    NSInteger i = 0;
    NSInteger n = code.length;
    for(; i < n; i++) {
        if ([[code substringWithRange:NSMakeRange((searchStart+i)%n, 1)] isEqualToString:@"0"]) {
            if (currentStart != -1) {
                //drawAt(currentStart, (searchStart+i-currentStart-1)%n)
                [result addObject:[NSString stringWithFormat:@"drawAt(%ld, %ld)", (long)currentStart, (long)(searchStart+i-currentStart-1)%n]];
                currentStart = -1;
            }
        } else {
            if (currentStart == -1) {
                currentStart = (searchStart + i) % n;
            }
        }
    }
    if (currentStart != -1) {
        //drawAt(currentStart, (searchStart+i-currentStart-1)%n)
        [result addObject:[NSString stringWithFormat:@"drawAt(%ld, %ld)", (long)currentStart, (long)(searchStart+i-currentStart-1)%n]];
        currentStart = -1;
    }
    
    return [result copy];
}

@end
