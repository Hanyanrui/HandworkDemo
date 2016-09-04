//
//  HandpickData.m
//  HandworkDemo
//
//  Created by student on 16/9/4.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "HandpickData.h"

@implementation HandpickData

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"slide" : [SlideModel class],
             @"navigation" : [NavigationModel class],
             @"advance" : [AdvanceModel class],
             @"hotTopic" : [HotTopicModel class],
            };
}
@end
