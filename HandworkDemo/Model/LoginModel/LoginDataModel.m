//
//  LoginDataModel.m
//  HandworkDemo
//
//  Created by student on 16/9/6.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "LoginDataModel.h"

@implementation LoginDataModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"unCircle" : [unCircleModel class],
             };
}
@end
