//
//  RegistViewController.m
//  HandworkDemo
//
//  Created by student on 16/9/6.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "RegistViewController.h"

@interface RegistViewController ()

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"注册";
    [self createSubViews];
    
}
-(void)createSubViews
{

    UIImageView *bgImageView=[[UIImageView alloc]initWithFrame:kMainB];
    bgImageView.image=[UIImage imageNamed:@"registerBackground.jpg"];
    bgImageView.userInteractionEnabled=YES;
    [self.view addSubview:bgImageView];

    UITextField *userNameTF=[UITextField new];
    userNameTF.borderStyle=UITextBorderStyleRoundedRect;
    userNameTF.alpha=0.8;
    userNameTF.placeholder=@"手机号";
  
    UITextField *testTF=[UITextField new];
    testTF.borderStyle=UITextBorderStyleRoundedRect;
    testTF.alpha=0.8;
    testTF.placeholder=@"密码";

    UITextField *passwordTF=[UITextField new];
    passwordTF.borderStyle=UITextBorderStyleRoundedRect;
    passwordTF.alpha=0.8;
    passwordTF.placeholder=@"密码";

    UIButton *registBtn=[UIButton buttonWithType:(UIButtonTypeSystem)];
    registBtn.backgroundColor=RedColor;
    [registBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    registBtn.titleLabel.font=[UIFont systemFontOfSize:20];
    [registBtn setTitle:@"注册" forState:(UIControlStateNormal)];
    [registBtn addTarget:self action:@selector(registBtnBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];

    UILabel *haveCountLB=[UILabel new];
    haveCountLB.textColor=[UIColor whiteColor];
    haveCountLB.adjustsFontSizeToFitWidth=YES;
    haveCountLB.textAlignment=NSTextAlignmentRight;
    haveCountLB.text=@"已有账号，去";
    
    
    UIButton *loginBtn=[UIButton buttonWithType:(UIButtonTypeSystem)];
    [loginBtn setTitleColor:  RedColor  forState:(UIControlStateNormal)];
    [loginBtn setTitle:@"登录" forState:(UIControlStateNormal)];
    loginBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
    [loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    
    
    UIView *bottomView=[UIView new];
    bottomView.backgroundColor=[UIColor whiteColor];
    
    UIButton*backBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"sgk_course_cate_cixiubianzhi_selected"] forState:(UIControlStateNormal)];
    [backBtn addTarget:self action:@selector(backBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view sd_addSubviews:@[userNameTF,testTF,passwordTF,registBtn,haveCountLB,loginBtn]];
    
    
    
    testTF.sd_layout.centerXEqualToView(self.view).centerYEqualToView(self.view).widthRatioToView(self.view,0.7).heightIs(35);
    
    userNameTF.sd_layout.leftEqualToView(testTF).rightEqualToView(testTF).heightIs(35).bottomSpaceToView(testTF,15);
    
    passwordTF.sd_layout.topSpaceToView(testTF,15).leftEqualToView(testTF).rightEqualToView(testTF).heightIs(35);
    
    registBtn.sd_layout.topSpaceToView(passwordTF,15).leftEqualToView(passwordTF).rightEqualToView(passwordTF).heightIs(35);
    
    
    haveCountLB.sd_layout.leftEqualToView(registBtn).topSpaceToView(registBtn,30).widthRatioToView(registBtn,0.4).heightRatioToView(registBtn,1);
    loginBtn.sd_layout.leftSpaceToView(haveCountLB,0).topEqualToView(haveCountLB).bottomEqualToView(haveCountLB).widthRatioToView(haveCountLB,0.5);
    
}











//重写父类方法
-(void)creatNavigationLeftBar
{
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"" style:(UIBarButtonItemStyleDone) target:nil action:nil];
}
-(void)creatNavigationRightBar
{
    self.tabBarController.tabBar.hidden=YES;
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
