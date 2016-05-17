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
@property (nonatomic, assign) FGFBNestedArrayComplexityType type;

@end

@implementation FGFBNestedArray

- (instancetype)initWithNestedArray:(NSArray *)nestedArray type:(FGFBNestedArrayComplexityType)type {
    if (self = [super init]) {
        _nestedArray = nestedArray;
        _type = type;
    }
    
    return self;
}

- (NSString *)nextObject {
    if (self.type == FGFBNestedArrayComplexityTypeQuick) {
        return [self nextObjectQuick];
    } else if (self.type == FGFBNestedArrayComplexityTypeSlow) {
        return [self nextObjectSlow];
    }
    
    NSAssert(NO, @"Add a new implementation");
    return nil;
    
}

#pragma mark - private
- (NSString *)nextObjectQuick {
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
        self.currentArray = [[FGFBNestedArray alloc] initWithNestedArray:object type:FGFBNestedArrayComplexityTypeQuick];
        
        return [self.currentArray nextObject];
    }
    
    return nil;
}

- (NSString *)nextObjectSlow {
    if (!self.enumerator) {
        self.enumerator = [[self.nestedArray flatten] objectEnumerator];
    }
    
    return [self.enumerator nextObject];
}

- (void)clear {
    self.enumerator = nil;
}

@end

@implementation NSArray (Flattern)

- (NSArray *)flatten {
    NSMutableArray *flatItems = [NSMutableArray array];
    for (id subObject in self)
    {
        if([subObject isKindOfClass:[NSArray class]]) {
            [flatItems addObjectsFromArray:[subObject flatten]];
        }
        else {
            [flatItems addObject:subObject];
        }
    }
    
    return flatItems;
}


@end
