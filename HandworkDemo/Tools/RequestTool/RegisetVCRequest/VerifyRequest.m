//
//  RegistRequest.m
//  HandworkDemo
//
//  Created by student on 16/9/6.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "VerifyRequest.h"

@implementation VerifyRequest
+(void)getDataWithDic:(NSDictionary*)dic withBlock:(VerifyBlock)block withErrorBlock:(ErrorBlock)failure
{
    [RequestDataTool post: VerifyUrl params:dic success:^(id responseObj) {
        VerifyData *data=[VerifyData yy_modelWithJSON:responseObj];
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
