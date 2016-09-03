//
//  TabBarViewController.m
//  HandworkDemo
//
//  Created by student on 16/9/2.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewController];
    
}
-(void)addChildViewController
{
    NSArray *childVCArr=@[@{ClassKey:@"HomeViewController",
                            TitleKey:@"首页",
                            ImageKey:@"icon_jiaocheng_@3x",
                            SelectImageKey:@"icon_jiaocheng_s@3x"},
                          @{ClassKey:@"TeachViewController",
                            TitleKey:@"教程",
                            ImageKey:@"icon_ketang_@3x",
                            SelectImageKey:@"icon_ketang_s@3x"},
                          @{ClassKey:@"HandGroupViewController",
                            TitleKey:@"手工圈",
                            ImageKey:@"icon_shougongquan_@3x",
                            SelectImageKey:@"icon_shougongquan_s@3x"},
                          @{ClassKey:@"FairViewController",
                            TitleKey:@"市集",
                            ImageKey:@"icon_shiji_@3x",
                            SelectImageKey:@"icon_shiji_s@3x"},
                          @{ClassKey:@"MineViewController",
                            TitleKey:@"我的",
                            ImageKey:@"icon_wode_@3x",
                            SelectImageKey:@"icon_wode_s@3x"}];
     __block UIViewController *vc=nil;
    [childVCArr enumerateObjectsUsingBlock:^(NSDictionary *dic, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *className=dic[ClassKey];
        vc=[NSClassFromString(className) new];
        vc.title=dic[TitleKey];
        NavViewController *nav=[[NavViewController alloc]initWithRootViewController:vc];
        nav.tabBarItem.title=dic[TitleKey];
        nav.tabBarItem.image=[UIImage imageNamed:dic[ImageKey]];
        nav.tabBarItem.selectedImage = [[UIImage imageNamed:dic[SelectImageKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:238/255.0 green:65/255.0 blue:67/255.0 alpha:1]} forState:UIControlStateSelected];
        [self addChildViewController:nav];
    }];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
