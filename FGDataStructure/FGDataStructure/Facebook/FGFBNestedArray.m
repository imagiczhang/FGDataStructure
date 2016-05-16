//
//  FGFBNestedArray.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 16/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGFBNestedArray.h"

@interface FGFBNestedArray ()

@property (nonatomic, strong) NSEnumerator *enumerator;
@property (nonatomic, strong) FGFBNestedArray *currentArray;

@end

@implementation FGFBNestedArray

- (instancetype)initWithNestedArray:(NSArray *)nestedArray {
    if (self = [super init]) {
        _nestedArray = nestedArray;
    }
    
    return self;
}

- (NSString *)nextObject {
    if (!self.enumerator) {
        self.enumerator = [self.nestedArray objectEnumerator];
    }
    
    if (self.currentArray) {
        id object = [self.currentArray nextObject];
        
        if (object) {
            self.currentArray = nil;
            return object;
        } else {
            return [self nextObjectFromOrignalArray];
        }
    } else {
        return [self nextObjectFromOrignalArray];
    }
    
    
    return nil;
}

- (NSString *)nextObjectFromOrignalArray {
    id object = [self.enumerator nextObject];
    
    if ([object isKindOfClass:[NSString class]]) {
        return object;
    } else if ([object isKindOfClass:[NSArray class]]) {
        self.currentArray = [[FGFBNestedArray alloc] initWithNestedArray:object];
        
        return [self.currentArray nextObject];
    }
    
    return nil;
}

- (void)clear {
    self.enumerator = nil;
}

@end
