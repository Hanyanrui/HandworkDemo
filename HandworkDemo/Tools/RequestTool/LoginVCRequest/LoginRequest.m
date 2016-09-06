//
//  LoginRequest.m
//  HandworkDemo
//
//  Created by student on 16/9/6.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "LoginRequest.h"

@implementation LoginRequest
+(void)getDataWithDic:(NSDictionary*)dic withBlock:(LoginBlock)block withErrorBlock:(ErrorBlock)failure
{
    [RequestDataTool post: LoginUrl params:dic success:^(id responseObj) {
        LoginData *data=[LoginData yy_modelWithJSON:responseObj];
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
