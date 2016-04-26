//
//  FGTreeType.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 25/04/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

typedef NS_ENUM(NSUInteger, FGTreeOrder) {
    /** The ordering is: the left subtree, the current node, the right subtree */
    FGTreeOrderInOrder,
    /** The ordering is: the current node, the left subtree, the right subtree */
    FGTreeOrderPreOrder,
    /** The ordering is: the left subtree, the right subtree, the current node. */
    FGTreeOrderPostOrder
};