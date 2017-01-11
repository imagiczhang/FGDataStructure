//
//  FindKthInSortedMatrix.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 8/01/2017.
//  Copyright © 2017 Feng Guo. All rights reserved.
//

#import "FindKthInSortedMatrix.h"
#import "FGHashHeap.h"

@implementation MatrixElement

- (instancetype)initWithValue:(NSInteger)value x:(NSInteger)x y:(NSInteger)y
{
    if (self = [super init]) {
        _value = value;
        _x = x;
        _y = y;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}

- (BOOL)isEqual:(id)object
{
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[self class]]) {
        return NO;
    }
    
    return [self isEqualToMatrixElement:object];
}

- (BOOL)isEqualToMatrixElement:(MatrixElement *)element
{
    if (self.value == element.value &&
        self.x == element.x &&
        self.y == element.y) {
        return YES;
    }
    return NO;
}

- (NSUInteger)hash
{
    return self.value ^ self.x ^ self.y;
}

@end

@implementation FindKthInSortedMatrix

+ (NSInteger)findKth:(NSInteger)k inMatrix:(NSArray<NSArray<NSNumber *> *> *)matrix
{
    NSUInteger n = matrix.count;
    if (n == 0) {
        return INT_MIN;
    }
    
    NSUInteger m = matrix[0].count;
    if (m == 0) {
        return INT_MIN;
    }
    
    if (k <= 0 || k > n * m) {
        return INT_MIN;
    }
    
    FGHashHeap<MatrixElement *> *minHeap = [[FGHashHeap alloc] initWithComparator:^NSComparisonResult(MatrixElement *element1, MatrixElement *element2) {
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
    [minHeap addItem:[[MatrixElement alloc] initWithValue:matrix[0][0].integerValue x:0 y:0]];
    
    for (int i = 0; i < k-1; i++) {
        MatrixElement *top = [minHeap poll];
        if (!top) {
            break;
        }
        
        NSInteger posX = top.x;
        NSInteger posY = top.y;
        
        if (posX < n-1 && !visited[posX+1][posY]) {
            visited[posX+1][posY] = YES;
            [minHeap addItem:[[MatrixElement alloc] initWithValue:matrix[posX+1][posY].integerValue x:posX+1 y:posY]];
        }
        
        if (posY < m-1 && !visited[posX][posY+1]) {
            visited[posX][posY+1] = YES;
            [minHeap addItem:[[MatrixElement alloc] initWithValue:matrix[posX][posY+1].integerValue x:posX y:posY+1]];
        }
    }
    
    MatrixElement *result = [minHeap peek];
    if (result) {
        return result.value;
    } else {
        return INT_MIN;
    }
}

@end
