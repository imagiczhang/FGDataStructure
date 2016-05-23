//
//  FGFBCancelableBlock.h
//  FGDataStructure
//
//  Created by Jingwei Huang on 21/05/2016.
//  Copyright © 2016 Feng Guo. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Impelment cancelable dispatch_after
 *
 *
 */


#ifndef FGFBCancelableBlock_h
#define FGFBCancelableBlock_h

typedef void(^dispatch_after_with_cancel_t)(BOOL shouldCancel);

// return a block
dispatch_after_with_cancel_t dispatch_after_with_cancel(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block);


// call this to cancel block
void cancel_block(dispatch_after_with_cancel_t block);

#endif