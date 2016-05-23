//
//  FGFBCancelableBlock2.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 23/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef FGFBCancelableBlock2_h
#define FGFBCancelableBlock2_h

NS_INLINE void dispatch_after_with_cancel_2(dispatch_time_t time, dispatch_queue_t queue, dispatch_block_t block, BOOL *shouldCancel) {
    dispatch_after(time, queue, ^{
        if (!*shouldCancel) {
            block();
        }
    });
}

#endif