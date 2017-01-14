//
//  FGWordSearchII.h
//  FGDataStructure
//
//  Created by Stephen Zhang on 14/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

//Given a matrix of lower alphabets and a dictionary. Find all words in the dictionary that can be found in the matrix. A word can start from any position in the matrix and go left/right/up/down to the adjacent position.
//Example
//Given matrix:
//doaf
//agai
//dcan
//and dictionary:
//{"dog", "dad", "dgdg", "can", "again"}
//
//return {"dog", "dad", "can", "again"}

@interface FGWordSearchII : NSObject

- (instancetype)initWithWords:(NSArray<NSString *> *)words NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;

- (NSArray<NSString *> *)wordsInBoard:(NSArray<NSArray<NSString *> *> *)board;

@end
