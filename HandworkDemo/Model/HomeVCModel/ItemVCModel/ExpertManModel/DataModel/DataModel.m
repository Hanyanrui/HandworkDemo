//
//  DataModel.m
//  HandworkDemo
//
//  Created by student on 16/9/5.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"list" : [ListModel class],
             };
}
@end
