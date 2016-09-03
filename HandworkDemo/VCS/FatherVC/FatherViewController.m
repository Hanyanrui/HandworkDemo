//
//  FatherViewController.m
//  HandworkDemo
//
//  Created by student on 16/9/3.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "FatherViewController.h"

@interface FatherViewController ()

@end

@implementation FatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatNavigationLeftBar];
    [self creatNavigationRightBar];
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
}
-(void)creatNavigationLeftBar
{
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_editGroup"] style:(UIBarButtonItemStyleDone) target:self action:@selector(editBtnClick)];
    
}
-(void)creatNavigationRightBar
{
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_fangdajing_"] style:(UIBarButtonItemStyleDone) target:self action:@selector(searchBtnClick)];
    
    
}
-(void)editBtnClick
{
    
    
}
-(void)searchBtnClick
{
    NSLog(@"222222");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   }


@end
