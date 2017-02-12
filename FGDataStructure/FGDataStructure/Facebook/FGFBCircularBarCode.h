//
//  FGFBCircularBarCode.h
//  FGDataStructure
//
//  Created by Stephen Zhang on 7/02/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

//Given a string with either "1" or "0" as the characters, call provided drawAt(int position, int length) to draw the circular bar code like fb messenger.
//int position means the position to start drawing, int length means the length of the line, 0 length means draw a dot.
//In the input, "1" means draw a dot, "0" means do nothing, consecutive "1"s like "111" means draw a line whose length is 2

//Follow ups: if the start of string is "1" and end is also "1", the start and end is treated as consecutive. In that case how to resolve the problem

@interface FGFBCircularBarCode : NSObject

// returns call log of method drawAt
+ (NSArray<NSString *> *)drawBarcodeWithCode:(NSString *)code;
+ (NSArray<NSString *> *)drawCircularBarcodeWithCode:(NSString *)code;

@end
