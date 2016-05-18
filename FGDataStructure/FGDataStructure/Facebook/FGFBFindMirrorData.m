//
//  FGFBFindMirrorData.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 18/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGFBFindMirrorData.h"

@implementation FGFBFindMirrorData

- (instancetype)initWithData:(NSString *)data {
    if (self = [super init]) {
        _data = data;
    }
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    FGFBFindMirrorData *copyedData = [[FGFBFindMirrorData alloc] init];
    copyedData.data = _data.copy;
    return copyedData;
}

@end
