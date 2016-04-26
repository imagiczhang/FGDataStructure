//
//  FGHashTable.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 26/04/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FGHashTable : NSObject

- (instancetype)initWithSize:(NSUInteger)size;
- (NSObject *)objectForKey:(NSString *)key;
- (void)setObject:(NSObject *)object forKey:(NSString *)key;
- (void)removeObjectForKey:(NSString *)key;

@end
