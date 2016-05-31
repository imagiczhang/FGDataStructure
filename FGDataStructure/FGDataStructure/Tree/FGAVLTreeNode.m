//
//  FGAVLTreeNode.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 31/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGAVLTreeNode.h"

@implementation FGAVLTreeNode

- (void)printDescription
{
    NSLog(@"%@", self.object);
    
    if (self.leftChild) {
        NSLog(@"Left child of %@ will be the -->", self.object);
        [self.leftChild printDescription];
    }
    
    if (self.rightChild) {
        NSLog(@"Right child of %@ will be the -->", self.object);
        [self.rightChild printDescription];
    }
}

@end
