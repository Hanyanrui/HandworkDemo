//
//  TeachViewController.m
//  HandworkDemo
//
//  Created by student on 16/9/3.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "TeachViewController.h"

@interface TeachViewController ()

@end

@implementation TeachViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatNavigationRightBar];
}
-(void)creatNavigationRightBar
{
   self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_wode_s"] style:(UIBarButtonItemStyleDone) target:self action:@selector(userBtnClick)];
}
-(void)userBtnClick
{
    NSLog(@"11111");

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}



@end
