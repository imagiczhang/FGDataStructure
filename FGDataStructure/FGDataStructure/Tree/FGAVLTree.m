//
//  FGAVLTree.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 31/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGAVLTree.h"
#import "FGAVLTreeNode.h"
#import "NSNumber+FGComparsion.h"

@implementation FGAVLTree

- (instancetype)initWithObject:(NSNumber *)obj
{
    if (self = [super init]) {
        _root            = [[FGAVLTreeNode alloc] init];
        self.root.object = obj;
        self.root.height = 0;
    }
    
    return self;
}

- (void)insertObject:(NSNumber *)newObject
{
    [self insertObject:newObject AtNode:self.root];
}

- (FGAVLTreeNode *)insertObject:(NSNumber *)newObject AtNode:(FGAVLTreeNode *)T
{
    if (!T) {
        T           = [[FGAVLTreeNode alloc] init];
        T.object    = newObject;
        T.leftChild = T.rightChild = nil;
        T.height    = 0;
    } else {
        if ([newObject isLessThan:T.object]) {
            T.leftChild = [self insertObject:newObject AtNode:T.leftChild];
            if ([FGAVLTree heightOfNode:T.leftChild] - [FGAVLTree heightOfNode:T.rightChild] == 2) {
                if ([newObject isGreaterThan:T.leftChild.object]) {
                    T = [FGAVLTree singleRotateWithLeft:T];
                } else {
                    T = [FGAVLTree doubleRotateWithLeft:T];
                }
            }
        } else if ([newObject isGreaterThan:T.object]) {
            T.rightChild = [self insertObject:newObject AtNode:T.rightChild];
            if ([FGAVLTree heightOfNode:T.rightChild] - [FGAVLTree heightOfNode:T.leftChild] == 2) {
                if ([newObject isGreaterThan:T.rightChild.object]) {
                    T = [FGAVLTree singleRotateWithRight:T];
                } else {
                    T = [FGAVLTree doubleRotateWithRight:T];
                }
            }
        }
        T.height = MAX([FGAVLTree heightOfNode:T.leftChild], [FGAVLTree heightOfNode:T.rightChild])+1;
    }
    return T;
}

- (void)printDescription
{
    [self.root printDescription];
}

- (FGAVLTreeNode *)find:(NSNumber *)obj
{
    FGAVLTreeNode *currentNode = self.root;
    while (YES) {
        if ([obj isGreaterThan:currentNode.object]) {
            if (currentNode.rightChild) {
                currentNode = currentNode.rightChild;
            } else
                return nil;
        } else if ([obj isLessThan:currentNode.object]) {
            if (currentNode.leftChild) {
                currentNode = currentNode.leftChild;
            } else
                return nil;
        } else {
            break;
        }
    }
    return currentNode;
}

- (void)deleteObject:(NSNumber *)object
{
    [self deleteObject:object AtNode:self.root];
}

- (FGAVLTreeNode *)deleteObject:(NSNumber *)object AtNode:(FGAVLTreeNode *)T
{
    if (!T) {
        return nil;
    }
    
    if ([object isEqual:T.object]) {
        if (T.rightChild == nil) {
            FGAVLTreeNode *temp = T;
            T = T.leftChild;
            temp = nil;
        } else {
            FGAVLTreeNode *temp = T.rightChild;
            while (temp.leftChild != nil) {
                temp = temp.leftChild;
            }
            
            T.object     = [temp.object copy];
            T.rightChild = [self deleteObject:temp.object AtNode:T.rightChild];
            T.height     = MAX([FGAVLTree heightOfNode:T.leftChild], [FGAVLTree heightOfNode:T.rightChild])+1;
        }
        return T;
    } else if ([object isLessThan:T.object]) {
        T.leftChild = [self deleteObject:object AtNode:T.leftChild];
    } else {
        T.rightChild = [self deleteObject:object AtNode:T.rightChild];
    }
    
    T.height = MAX([FGAVLTree heightOfNode:T.leftChild], [FGAVLTree heightOfNode:T.rightChild])+1;
    
    if (T.leftChild != nil) {
        T.leftChild = [FGAVLTree rotateSingleNode:T.leftChild];
    }
    if (T.rightChild != nil) {
        T.rightChild = [FGAVLTree rotateSingleNode:T.rightChild];
    }
    T = [FGAVLTree rotateSingleNode:T];
    return T;
}

+ (NSInteger)heightOfNode:(FGAVLTreeNode *)node
{
    if (!node) {
        return -1;
    }
    else {
        return node.height;
    }
}

#pragma mark - AVL Rotation

+ (FGAVLTreeNode *)singleRotateWithLeft:(FGAVLTreeNode *)K2
{
    FGAVLTreeNode *K1;
    
    K1            = K2.leftChild;
    K2.leftChild  = K1.rightChild;
    K1.rightChild = K2;
    
    K2.height = MAX([FGAVLTree heightOfNode:K2.leftChild], [FGAVLTree heightOfNode:K2.rightChild])+1;
    K1.height = MAX([FGAVLTree heightOfNode:K1.leftChild], [FGAVLTree heightOfNode:K1.rightChild])+1;
    
    return K1;
}

+ (FGAVLTreeNode *)singleRotateWithRight:(FGAVLTreeNode *)K2
{
    FGAVLTreeNode *K1;
    
    K1            = K2.rightChild;
    K2.rightChild = K1.leftChild;
    K1.leftChild  = K2;
    
    K2.height = MAX([FGAVLTree heightOfNode:K2.leftChild], [FGAVLTree heightOfNode:K2.rightChild])+1;
    K1.height = MAX([FGAVLTree heightOfNode:K1.leftChild], [FGAVLTree heightOfNode:K1.rightChild])+1;
    
    return K1;
}

+ (FGAVLTreeNode *)doubleRotateWithLeft:(FGAVLTreeNode *)K3
{
    K3.leftChild = [FGAVLTree singleRotateWithRight:K3.leftChild];
    return [FGAVLTree singleRotateWithLeft:K3];
}

+ (FGAVLTreeNode *)doubleRotateWithRight:(FGAVLTreeNode *)K3
{
    K3.rightChild = [FGAVLTree singleRotateWithLeft:K3.rightChild];
    return [FGAVLTree singleRotateWithRight:K3];
}

+ (FGAVLTreeNode *)rotateSingleNode:(FGAVLTreeNode *)T
{
    if ([FGAVLTree heightOfNode:T.leftChild] - [FGAVLTree heightOfNode:T.rightChild] == 2) {
        if ([FGAVLTree heightOfNode:T.leftChild.leftChild] >= [FGAVLTree heightOfNode:T.leftChild.rightChild]) {
            T = [FGAVLTree singleRotateWithLeft:T];
        } else {
            T = [FGAVLTree doubleRotateWithLeft:T];
        }
    }
    if ([FGAVLTree heightOfNode:T.rightChild] - [FGAVLTree heightOfNode:T.leftChild] == 2) {
        if ([FGAVLTree heightOfNode:T.rightChild.rightChild] >= [FGAVLTree heightOfNode:T.rightChild.leftChild]) {
            T = [FGAVLTree singleRotateWithRight:T];
        } else {
            T = [FGAVLTree doubleRotateWithRight:T];
        }
    }
    return T;
}

@end
