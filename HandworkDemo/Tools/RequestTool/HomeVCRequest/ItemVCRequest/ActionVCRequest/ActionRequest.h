//
//  AttentionRequest.h
//  HandworkDemo
//
//  Created by student on 16/9/5.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ActionData.h"
typedef void(^AttentionBlock)(ActionData*data);
typedef void(^ErrorBlock)(NSError*);
@interface ActionRequest : NSObject
+(void)getDataWithID:(NSString*)acId withBlock:(AttentionBlock)block withErrorBlock:(ErrorBlock)failure;
@end
