//
//  NavViewController.m
//  HandworkDemo
//
//  Created by student on 16/9/3.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "NavViewController.h"

@interface NavViewController ()

@end

@implementation NavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setProperty];
    
    
    
}
-(void)setProperty
{
    self.navigationBar.titleTextAttributes=@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor whiteColor]};
   self.navigationBar.barTintColor=[UIColor colorWithRed:238/255.0 green:65/255.0 blue:67/255.0 alpha:1];
    self.navigationBar.translucent=NO;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
