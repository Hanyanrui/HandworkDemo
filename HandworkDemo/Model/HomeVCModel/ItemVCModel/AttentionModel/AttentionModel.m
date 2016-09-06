//
//  AttentionModel.m
//  HandworkDemo
//
//  Created by student on 16/9/6.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "AttentionModel.h"

@implementation AttentionModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"course" : [CourseModel class],
             @"follow":[FollowModel class],
             @"circle":[CircleModel class]
             };
}
@end
