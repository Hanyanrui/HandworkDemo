//
//  AddGuanZhuRequest.m
//  HandworkDemo
//
//  Created by student on 16/9/7.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "AddGuanZhuRequest.h"

@implementation AddGuanZhuRequest
+(void)getDataWithDic:(NSDictionary*)dic withBlock:(AddGuanZhuBlock)block withErrorBlock:(ErrorBlock)failure
{
    [RequestDataTool post:AddGuanzhuUrl params:dic success:^(id responseObj) {
        
        AddGuanZhuData *data=[ AddGuanZhuData yy_modelWithJSON:responseObj];
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
