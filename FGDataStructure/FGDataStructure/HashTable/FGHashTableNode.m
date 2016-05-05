//
//  FGHashTableNode.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 26/04/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGHashTableNode.h"

@implementation FGHashTableNode

- (instancetype)initWithObject:(NSObject *)object key:(NSString *)key {
    if (self = [super init]) {
        _object = object;
        _key = key;
    }
    
    return self;
}

@end
