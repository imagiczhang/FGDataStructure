//
//  FGHR2DArrayDS.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 4/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGHR2DArrayDS.h"

@interface FGHR2DArrayDS ()

@property (nonatomic, strong) NSArray<FGHR2DArrayDSModel *> *array;

@end

@implementation FGHR2DArrayDS

+ (NSInteger)resultFromArray:(NSArray <FGHR2DArrayDSModel *> *)array {
    NSInteger largest = 0;

    for (int i = 0; i < array.count - 2; i++) {
        for (int j = 0; j < ((FGHR2DArrayDSModel *)array[i]).array.count - 2; j++) {
            
            NSInteger sum = 0;
            sum += ((NSNumber *)array[i].array[j]).integerValue;
            sum += ((NSNumber *)array[i].array[j+1]).integerValue;
            sum += ((NSNumber *)array[i].array[j+2]).integerValue;
            sum += ((NSNumber *)array[i+1].array[j+1]).integerValue;
            sum += ((NSNumber *)array[i+2].array[j]).integerValue;
            sum += ((NSNumber *)array[i+2].array[j+1]).integerValue;
            sum += ((NSNumber *)array[i+2].array[j+2]).integerValue;
            
            if (sum > largest || ((i == 0) && (j == 0))) {
                largest = sum;
            }
        }
    }
    
    return largest;
}

@end

@implementation FGHR2DArrayDSModel

- (instancetype)initWithArray:(NSArray<NSNumber *> *)array {
    if (self = [super init]) {
        _array = array;
    }
    return self;
}

@end
