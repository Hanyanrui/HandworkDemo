//
//  FairViewController.m
//  HandworkDemo
//
//  Created by student on 16/9/3.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "FairViewController.h"

@interface FairViewController ()

@end

@implementation FairViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatNavigationLeftBar];
}
-(void)creatNavigationLeftBar
{
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"sgk_course_sort_product"] style:(UIBarButtonItemStyleDone) target:self action:@selector(ShopingCartBtnClick)];
}
-(void)ShopingCartBtnClick
{




}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
