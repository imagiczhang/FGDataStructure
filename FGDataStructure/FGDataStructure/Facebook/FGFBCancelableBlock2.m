//
//  FGFBCancelableBlock2.m
//  FGDataStructure
//
//  Created by Jingwei Huang on 22/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import "FGFBCancelableBlock2.h"


void dispatch_after_with_cancel(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block, BOOL *shouldCancel) {
    
    dispatch_after(when, queue, block);
}