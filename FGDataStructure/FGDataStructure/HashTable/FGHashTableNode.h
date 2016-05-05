//
//  FGHashTableNode.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 26/04/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FGHashTableNode : NSObject

@property (nonatomic, strong) NSObject *object;
@property (nonatomic, strong, readonly) NSString *key;

- (instancetype)initWithObject:(NSObject *)object key:(NSString *)key;

@end
