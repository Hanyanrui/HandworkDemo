//
//  LoginViewController.m
//  HandworkDemo
//
//  Created by student on 16/9/6.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
{
    UITextField *_passwordTF;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"登录";
    [self createSubViews];
}
-(void)createSubViews
{
    UIImageView *bgImageView=[[UIImageView alloc]initWithFrame:kMainB];
    bgImageView.image=[UIImage imageNamed:@"loginBackground"];
    bgImageView.userInteractionEnabled=YES;
    [self.view addSubview:bgImageView];

    UITextField *userNameTF=[UITextField new];
    userNameTF.borderStyle=UITextBorderStyleRoundedRect;
    userNameTF.alpha=0.8;
    userNameTF.placeholder=@"手机号/邮箱/用户名";

    UITextField *passwordTF=[UITextField new];
    passwordTF.borderStyle=UITextBorderStyleRoundedRect;
    passwordTF.alpha=0.8;
    passwordTF.placeholder=@"密码";
    _passwordTF=passwordTF;
    
    
    UIButton *eyeBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
    eyeBtn.backgroundColor=[UIColor grayColor];
    [eyeBtn addTarget:self action:@selector(eyeBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    UIButton *loginBtn=[UIButton buttonWithType:(UIButtonTypeSystem)];
    loginBtn.backgroundColor=RedColor;
    [loginBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    loginBtn.titleLabel.font=[UIFont systemFontOfSize:20];
    [loginBtn setTitle:@"登录" forState:(UIControlStateNormal)];
    [loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    UIButton *forgetBtn=[UIButton buttonWithType:(UIButtonTypeSystem)];
    [forgetBtn setTitle:@"忘记密码" forState:(UIControlStateNormal)];
    forgetBtn.titleLabel.adjustsFontSizeToFitWidth=YES;
    [forgetBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [forgetBtn addTarget:self action:@selector(forgetBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    UILabel *otherWayLB=[UILabel new];
    otherWayLB.adjustsFontSizeToFitWidth=YES;
    otherWayLB.textColor=[UIColor whiteColor];
    otherWayLB.text=@"使用其他方式登录";
    
    UIButton *weiboBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
    weiboBtn.backgroundColor=[UIColor redColor];
    [weiboBtn addTarget:self action:@selector(weiboBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    UIButton *qqBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
    qqBtn.backgroundColor=[UIColor blueColor];
    [qqBtn addTarget:self action:@selector(qqBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    UIButton *registBtn=[UIButton buttonWithType:(UIButtonTypeSystem)];
    registBtn.backgroundColor=[UIColor whiteColor];
    registBtn.alpha=0.5;
     [registBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [registBtn setTitle:@"注册" forState:(UIControlStateNormal)];
    [registBtn addTarget:self action:@selector(registBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
   
    UIView *bottomView=[UIView new];
    bottomView.backgroundColor=[UIColor whiteColor];
    
    UIButton*backBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"sgk_course_cate_cixiubianzhi_selected"] forState:(UIControlStateNormal)];
    [backBtn addTarget:self action:@selector(backBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view sd_addSubviews:@[userNameTF,passwordTF,loginBtn,forgetBtn,otherWayLB,weiboBtn,qqBtn,registBtn,bottomView,eyeBtn]];
    [bottomView sd_addSubviews:@[backBtn]];
    
    passwordTF.sd_layout.centerXEqualToView(self.view).centerYEqualToView(self.view).widthRatioToView(self.view,0.7).heightIs(35);
    
    userNameTF.sd_layout.leftEqualToView(passwordTF).rightEqualToView(passwordTF).heightIs(35).bottomSpaceToView(passwordTF,15);
    
    eyeBtn.sd_layout.centerYEqualToView(passwordTF).rightSpaceToView(self.view,kMainW*0.15+15).widthIs(20).heightIs(10);
    
    loginBtn.sd_layout.topSpaceToView(passwordTF,15).leftEqualToView(passwordTF).rightEqualToView(passwordTF).heightIs(35);
    loginBtn.sd_cornerRadiusFromHeightRatio=@0.1;
    
    forgetBtn.sd_layout.leftEqualToView(loginBtn).topSpaceToView(loginBtn,15).widthRatioToView(loginBtn,0.25).heightRatioToView(loginBtn,0.5);
    
    otherWayLB.sd_layout.topSpaceToView(forgetBtn,15).centerXEqualToView(loginBtn).heightRatioToView(loginBtn,0.5).widthRatioToView(loginBtn,0.5);
    
    weiboBtn.sd_layout.topSpaceToView(otherWayLB,20).leftEqualToView(otherWayLB).heightIs(40).widthEqualToHeight();
    weiboBtn.sd_cornerRadiusFromHeightRatio=@0.5;
    
    
    
    qqBtn.sd_layout.rightEqualToView(otherWayLB).widthRatioToView(weiboBtn,1).heightEqualToWidth().topEqualToView(weiboBtn);
    qqBtn.sd_cornerRadiusFromHeightRatio=@0.5;
    
    registBtn.sd_layout.centerXEqualToView(otherWayLB).topSpaceToView(weiboBtn,30).widthRatioToView(otherWayLB,0.6).heightRatioToView(otherWayLB,1.6);
    registBtn.sd_cornerRadiusFromHeightRatio=@0.5;
    
    bottomView.sd_layout.bottomEqualToView(self.view).rightEqualToView(self.view).leftEqualToView(self.view).heightIs(44);
    
    backBtn.sd_layout.centerYEqualToView(bottomView).leftSpaceToView(bottomView,30).heightRatioToView(bottomView,0.5).widthEqualToHeight();

}
-(void)eyeBtnClick:(UIButton*)sender
{

    _passwordTF.secureTextEntry=!_passwordTF.secureTextEntry;
    NSLog(@"ddddd");
}
-(void)loginBtnClick:(UIButton*)sender
{
    
    
    
    
}
-(void)forgetBtnClick:(UIButton*)sender
{
    
    
    
    
}
-(void)weiboBtnClick:(UIButton*)sender
{
    
    
    
    
}
-(void)qqBtnClick:(UIButton*)sender
{
    
    
    
    
}
-(void)registBtnClick:(UIButton*)sender
{
    
    [self.navigationController pushViewController:[RegistViewController new] animated:YES];
    
    
}

-(void)backBtnClick:(UIButton*)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];

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
    // Dispose of any resources that can be recreated.
}


@end
