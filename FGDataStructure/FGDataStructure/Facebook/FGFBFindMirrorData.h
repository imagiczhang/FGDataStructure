//
//  FGFBFindMirrorData.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 18/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FGFBFindMirrorData : NSObject <NSCopying>

@property (nonatomic, strong) NSString *data;

- (instancetype)initWithData:(NSString *)data;

@end
