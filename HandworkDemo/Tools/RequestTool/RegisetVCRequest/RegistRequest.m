//
//  RegistRequest.m
//  HandworkDemo
//
//  Created by student on 16/9/6.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "RegistRequest.h"

@implementation RegistRequest
+(void)getDataWithDic:(NSDictionary*)dic withBlock:(RegistBlock)block withErrorBlock:(ErrorBlock)failure
{
    [RequestDataTool post: RegistUrl params:dic success:^(id responseObj) {
        RegistData *data=[RegistData yy_modelWithJSON:responseObj];
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
