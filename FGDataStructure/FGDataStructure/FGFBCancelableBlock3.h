//
//  FGFBCancelableBlock3.h
//  FGDataStructure
//
//  Created by Stephen Zhang on 3/12/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#ifndef FGFBCancelableBlock3_h
#define FGFBCancelableBlock3_h


typedef void(^dispatch_after_cancel_block)(void);

dispatch_after_cancel_block dispatch_after_with_cancel(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block) {
    __block BOOL isTaskCancelled = NO;
    dispatch_after(when, queue, ^(){
        if (!isTaskCancelled && block) {
            block();
        }
    });
    
    return ^(){
        isTaskCancelled = YES;
    };
}

#endif /* FGFBCancelableBlock3_h */
