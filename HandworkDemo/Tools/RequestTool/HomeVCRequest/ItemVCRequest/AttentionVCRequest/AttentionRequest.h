//
//  AttentionRequest.h
//  HandworkDemo
//
//  Created by student on 16/9/6.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^AttentionBlock)(AttentionData*data);
typedef void(^ErrorBlock)(NSError*);

@interface AttentionRequest : NSObject
+(void)getDataWithDic:(NSDictionary*)dic withBlock:(AttentionBlock)block withErrorBlock:(ErrorBlock)failure;
@end
