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


void test() {
    dispatch_after_with_cancel_t block = dispatch_after_with_cancel(dispatch_time(DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        NSLog(@"do something");
    });
    
    cancel_block(block);
    
}

void dispatch_after_cancel(dispatch_block_t block, BOOL *shouldCancel) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (!*shouldCancel) {
            block();
        }
    });
}

void test2() {
    BOOL stop = NO;
    dispatch_after_cancel(^{
        NSLog(@"do something");
    }, &stop);
    stop = YES;
}



