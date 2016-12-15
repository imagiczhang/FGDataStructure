//
//  FGFBTraverseTree.m
//  FGDataStructure
//
//  Created by Stephen Zhang on 6/12/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGFBTraverseTree.h"

@implementation FGFBTreeNode

- (instancetype)initWithValue:(NSObject<NSCopying> *)value
{
    if (self = [super init]) {
        _value = [value copy];
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    FGFBTreeNode *node = [[[self class] allocWithZone:zone] initWithValue:self.value];
    node.left = [self.left copy];
    node.right = [self.right copy];
    return node;
}

@end

@interface FGFBTraverseTree()

@property (nonatomic, strong) tree_node_visit_block_t visit;

@end

@implementation FGFBTraverseTree

- (instancetype)initWithVisitBlock:(tree_node_visit_block_t)block
{
    if (self = [super init]) {
        _visit = block;
    }
    return self;
}

- (void)preOrderTraverseTree:(FGFBTreeNode *)root
{
    self.visit(root);
    if (root.left) {
        [self preOrderTraverseTree:root.left];
    }
    if (root.right) {
        [self preOrderTraverseTree:root.right];
    }
}

- (void)inOrderTraverseTree:(FGFBTreeNode *)root
{
    if (root.left) {
        [self inOrderTraverseTree:root.left];
    }
    self.visit(root);
    if (root.right) {
        [self inOrderTraverseTree:root.right];
    }
}

- (void)postOrderTraverseTree:(FGFBTreeNode *)root
{
    if (root.left) {
        [self postOrderTraverseTree:root.left];
    }
    if (root.right) {
        [self postOrderTraverseTree:root.right];
    }
    self.visit(root);
}

@end

@interface FGFBInOrderTreeEnumerator()

@property (nonatomic, strong) FGFBTreeNode *root;
@property (nonatomic, strong) FGFBTreeNode *current;
@property (nonatomic, strong) NSMutableArray<FGFBTreeNode *> *ancestors;

@end

@implementation FGFBInOrderTreeEnumerator

- (instancetype)initWithTree:(FGFBTreeNode *)root
{
    if (self = [super init]) {
        _root = root;
        _ancestors = [NSMutableArray array];
    }
    return self;
}

- (id)nextObject
{
    if (!self.current) {
        self.current = [self findNextFromStart:self.root];
    } else {
        self.current = [self findNextFromCompletedNode:self.current];
    }
    return self.current;
}

- (id)findNextFromStart:(FGFBTreeNode *)node
{
    while (node.left) {
        [self.ancestors addObject:node];
        node = node.left;
    }
    self.current = node;
    return node;
}

- (id)findNextFromCompletedNode:(FGFBTreeNode *)node
{
    if (node.right) {
        [self.ancestors addObject:node];
        return [self findNextFromStart:node.right];
    }
    
    FGFBTreeNode *current = node;
    FGFBTreeNode *parent = [self.ancestors lastObject];
    FGFBTreeNode *next;
    
    while(current && parent && !next) {
        if (current == parent.left) {
            next = parent;
            [self.ancestors removeLastObject];
        } else {
            current = parent;
            [self.ancestors removeLastObject];
            parent = [self.ancestors lastObject];
        }
    }
    self.current = next;
    return next;
}

@end

@interface FGFBPreOrderTreeEnumerator()

@property (nonatomic, strong) FGFBTreeNode *root;
@property (nonatomic, strong) FGFBTreeNode *current;
@property (nonatomic, strong) NSMutableArray<FGFBTreeNode *> *ancestors;

@end

@implementation FGFBPreOrderTreeEnumerator

- (instancetype)initWithTree:(FGFBTreeNode *)root
{
    if (self = [super init]) {
        _root = root;
        _ancestors = [NSMutableArray array];
    }
    return self;
}

- (id)nextObject
{
    if (!self.current) {
        self.current = self.root;
    } else {
        if (self.current.left) {
            [self.ancestors addObject:self.current];
            self.current = self.current.left;
        } else if (self.current.right) {
            [self.ancestors addObject:self.current];
            self.current = self.current.right;
        } else {
            FGFBTreeNode *current = self.current;
            FGFBTreeNode *parent = [self.ancestors lastObject];
            FGFBTreeNode *next;
            while (parent && current && !next) {
                if (current == parent.left) {
                    next = parent.right;
                } else {
                    current = parent;
                    [self.ancestors removeLastObject];
                    parent = [self.ancestors lastObject];
                }
            }
            self.current = next;
        }
    }
    return self.current;
}

@end

@interface FGFBPostOrderTreeEnumerator()

@property (nonatomic, strong) FGFBTreeNode *root;
@property (nonatomic, strong) FGFBTreeNode *current;
@property (nonatomic, strong) NSMutableArray<FGFBTreeNode *> *ancestors;

@end

@implementation FGFBPostOrderTreeEnumerator

- (instancetype)initWithTree:(FGFBTreeNode *)root
{
    if (self = [super init]) {
        _root = root;
        _ancestors = [NSMutableArray array];
    }
    return self;
}

- (id)nextObject
{
    if (!self.current) {
        [self findNextFromStart:self.root];
    } else {
        [self findNextFromCompletedNode:self.current];
    }
    return self.current;
}

- (id)findNextFromStart:(FGFBTreeNode *)node
{
    while (node.left) {
        [self.ancestors addObject:node];
        node = node.left;
    }
    self.current = node;
    return node;
}

- (id)findNextFromCompletedNode:(FGFBTreeNode *)node
{
    FGFBTreeNode *current = node;
    FGFBTreeNode *parent = [self.ancestors lastObject];
    FGFBTreeNode *next;
    if (current == parent.left && parent.right) {
        next = [self findNextFromStart:parent.right];
    } else {
        next = parent;
        [self.ancestors removeLastObject];
    }
    self.current = next;
    return next;
}

@end

@implementation FGFBInOrderTreeBuilder

- (FGFBTreeNode *)buildTreeWithInOrderSequence:(NSArray<NSNumber *> *)numbers
{
    return [self buildTreeWithInOrderSequence:numbers range:NSMakeRange(0, numbers.count)];
}

- (FGFBTreeNode *)buildTreeWithInOrderSequence:(NSArray<NSNumber *> *)numbers range:(NSRange)range;
{
    NSAssert(range.length > 0, @"range must have more than one element");
    FGFBTreeNode *node;
    if (range.length == 1) {
        node = [[FGFBTreeNode alloc] initWithValue:numbers[range.location]];
    } else {
        NSUInteger middle = range.location + (range.length - 1)/2;
        node = [[FGFBTreeNode alloc] initWithValue:numbers[middle]];
        if (middle != range.location) {
            node.left = [self buildTreeWithInOrderSequence:numbers range:NSMakeRange(range.location, middle-range.location)];
        }
        if (middle != range.location + range.length - 1) {
            node.right = [self buildTreeWithInOrderSequence:numbers range:NSMakeRange(middle + 1, range.location + range.length - middle - 1)];
        }
    }
    return node;
}

@end


@implementation FGFBTreeSerializer

+ (NSArray *)serializeTree:(FGFBTreeNode *)root
{
    NSMutableArray *array = [NSMutableArray array];
    [self serializeTree:root withOutput:array];
    return [array copy];
}

+ (void)serializeTree:(FGFBTreeNode *)root withOutput:(NSMutableArray *)array
{
    if(root) {
        [array addObject:root.value];
        [self serializeTree:root.left withOutput:array];
        [self serializeTree:root.right withOutput:array];
    } else {
        [array addObject:[NSNull null]];
    }
}

+ (FGFBTreeNode *)deserializeFromArray:(NSArray *)array
{
    if (array.count == 0) {
        return nil;
    }
    
    NSUInteger index = 0;
    return [self deserializeFromArray:array fromIndex:&index];
}

+ (FGFBTreeNode *)deserializeFromArray:(NSArray *)array fromIndex:(NSUInteger *)index
{
    if (*index >= array.count) {
        return nil;
    }
    id Obj = array[*index];
    if([Obj isKindOfClass:[NSNull class]]) {
        *index += 1;
        return nil;
    }
    
    FGFBTreeNode *node = [[FGFBTreeNode alloc] initWithValue:Obj];
    *index += 1;
    node.left = [self deserializeFromArray:array fromIndex:index];
    node.right = [self deserializeFromArray:array fromIndex:index];
    
    return node;
}

@end
