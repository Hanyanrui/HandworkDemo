//
//  ExpertManRequest.m
//  HandworkDemo
//
//  Created by student on 16/9/5.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "ExpertManRequest.h"

@implementation ExpertManRequest
+(void)getData:(ExperManBlock)block
{
[RequestDataTool post:ExpertManUrl params:nil success:^(id responseObj) {
    
    ExpertManData *data=[ ExpertManData yy_modelWithJSON:responseObj];
    if (block)
    {
        block(data);
    }
} failure:^(NSError * error) {
    NSLog(@"%@",error);
}];
}
@end
