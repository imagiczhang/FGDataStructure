//
//  FGFBCancelableBlock.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 21/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGFBCancelableBlock.h"

dispatch_after_with_cancel_t dispatch_after_with_cancel(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block) {
    __block dispatch_block_t originalBlock = [block copy];
    
    __block dispatch_after_with_cancel_t cancelableBlock = ^(BOOL shouldCancel) {
        if (shouldCancel == NO && originalBlock) {
            originalBlock();
        }
        
        originalBlock = nil;
    };
    
    dispatch_after(when, queue, ^{
        if (cancelableBlock) {
            cancelableBlock(NO);
            cancelableBlock = nil;
        }
    });
    
    return cancelableBlock;
}

void cancel_block(dispatch_after_with_cancel_t block) {
    if (block) {
        block(YES);
        block = nil;
    }
}

