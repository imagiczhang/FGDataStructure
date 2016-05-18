//
//  FGGPFibonacciCalculator.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 18/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGGPFibonacciCalculator.h"

@implementation FGGPFibonacciCalculator

//o(n)
+ (NSInteger)fibonacciInN:(NSInteger)n {
    if (n == 0) return 0;
    if (n == 1) return 1;
    
    NSInteger previous = 0;
    NSInteger current = 1;
    
    for (NSInteger i = 2; i <= n; i++) {
        NSInteger next = current + previous;
        previous = current;
        current = next;
    }
    
    return current;
}

@end
