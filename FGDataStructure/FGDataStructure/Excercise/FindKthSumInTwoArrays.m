//
//  FindKthSumInTwoArrays.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 9/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import "FindKthSumInTwoArrays.h"
#import "FindKthInSortedMatrix.h"
#import "FGHashHeap.h"

@implementation FindKthSumInTwoArrays

+ (NSInteger)findKthSum:(NSInteger)k inArray:(NSArray<NSNumber *> *)array1 andArray:(NSArray<NSNumber *> *)array2
{
    NSUInteger n = array1.count;
    NSUInteger m = array2.count;
    NSAssert(n > 0 && m > 0, @"input array must not be empty");
    
    if (k <=0 || k > m*n) {
        return INT_MIN;
    }
    
    FGHashHeap<MatrixElement *> *minHeap = [[FGHashHeap alloc] initWithComparator:^NSComparisonResult(MatrixElement *element1, MatrixElement *element2){
        if (element1.value < element2.value) {
            return NSOrderedAscending;
        } else if (element1.value > element2.value) {
            return NSOrderedDescending;
        } else {
            return NSOrderedSame;
        }
    }];
    
    BOOL visited[n][m];
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
            visited[i][j] = NO;
        }
    }
    visited[0][0] = YES;
    [minHeap addItem:[[MatrixElement alloc] initWithValue:array1[0].integerValue + array2[0].integerValue x:0 y:0]];
    
    for (int i = 0; i < k-1; i++) {
        MatrixElement *top = [minHeap poll];
        if (!top) {
            break;
        }
        
        NSInteger posX = top.x;
        NSInteger posY = top.y;
        
        if (posX < n-1 && !visited[posX+1][posY]) {
            visited[posX+1][posY] = YES;
            [minHeap addItem:[[MatrixElement alloc] initWithValue:array1[posX+1].integerValue + array2[posY].integerValue x:posX+1 y:posY]];
        }
        
        if (posY < m-1 && !visited[posX][posY+1]) {
            visited[posX][posY+1] = YES;
            [minHeap addItem:[[MatrixElement alloc] initWithValue:array1[posX].integerValue + array2[posY+1].integerValue x:posX y:posY+1]];
        }
    }
    
    MatrixElement *result = [minHeap peek];
    if (!result) {
        return INT_MIN;
    }
    
    return result.value;
}

@end
