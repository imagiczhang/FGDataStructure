//
//  FGBSTreeObject.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 19/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGBSTreeObject.h"

@implementation FGBSTreeObject

- (instancetype)initWithNumber:(NSNumber *)number {
    if (self = [super init]) {
        _number = number;
    }
    return self;
}

@end
