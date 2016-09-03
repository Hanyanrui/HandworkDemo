//
//  GuideTool.m
//  HandworkDemo
//
//  Created by student on 16/9/2.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "GuideTool.h"

@implementation GuideTool
+(UIViewController*)chooseRootViewController
{
    UIViewController *returnVC=nil;
    
    NSDictionary *dic=[NSBundle mainBundle].infoDictionary;
    //现在版本
    NSString *nowVerson=dic[@"CFBundleShortVersionString"];
    //上一次版本
    NSString *lastVerson=[UserDefaults objectForKey:VersionsKey];
    
    if ([nowVerson isEqualToString:lastVerson])
    {
        returnVC=[ImageViewController new];
    }
    else
    {
        returnVC=[GuideViewController new];
        [UserDefaults setObject:nowVerson forKey:VersionsKey];
    }
    return returnVC;
}
@end
