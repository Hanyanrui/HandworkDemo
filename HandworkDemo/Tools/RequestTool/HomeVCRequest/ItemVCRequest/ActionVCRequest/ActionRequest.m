//
//  AttentionRequest.m
//  HandworkDemo
//
//  Created by student on 16/9/5.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "ActionRequest.h"

@implementation ActionRequest
+(void)getDataWithID:(NSString*)acId withBlock:(ActionBlock)block withErrorBlock:(ErrorBlock)failure
{
    
    NSString *url=[NSString stringWithFormat:@"http://m.shougongke.com/index.php?&c=Course&a=activityList&vid=20&id=%@",acId];
    [RequestDataTool get:url params:nil success:^(id responseObj) {
       ActionData  *data=[ ActionData yy_modelWithJSON:responseObj];
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
