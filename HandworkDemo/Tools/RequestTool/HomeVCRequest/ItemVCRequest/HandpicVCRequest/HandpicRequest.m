//
//  HandpicRequest.m
//  HandworkDemo
//
//  Created by student on 16/9/4.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "HandpicRequest.h"

@implementation HandpicRequest
+(void)getData:(HandpicBlock)block
{
[RequestDataTool get:HandPicUrl params:nil success:^(id responseObj) {
    HandpickData *data=[HandpickData yy_modelWithJSON:responseObj[@"data"]];
    if (block)
    {
        block(data);
    }
} failure:^(NSError *error) {
    if (error)
    {
        NSLog(@"精品error---%@",error);
    }
}];


}

@end
