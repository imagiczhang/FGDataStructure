//
//  FGTreeType.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 25/04/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

typedef NS_ENUM(NSUInteger, FGTreeOrderType) {
    /** The ordering is: the left subtree, the current node, the right subtree */
    FGTreeOrderTypeInOrder,
    /** The ordering is: the current node, the left subtree, the right subtree */
    FGTreeOrderTypePreOrder,
    /** The ordering is: the left subtree, the right subtree, the current node. */
    FGTreeOrderTypePostOrder
};