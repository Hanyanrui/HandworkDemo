//
//  AttentionRequest.m
//  HandworkDemo
//
//  Created by student on 16/9/6.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "AttentionRequest.h"

@implementation AttentionRequest
+(void)getDataWithDic:(NSDictionary*)dic withBlock:(AttentionBlock)block withErrorBlock:(ErrorBlock)failure
{
    [RequestDataTool post:GuanzhuUrl params:dic success:^(id responseObj) {
        
        AttentionData *data=[AttentionData yy_modelWithJSON:responseObj];
        if (block)
        {
            block(data);
        }
    } failure:^(NSError * error) {
        
        if (failure)
        {
            failure(error);
        }
        
    }];
}

@end
