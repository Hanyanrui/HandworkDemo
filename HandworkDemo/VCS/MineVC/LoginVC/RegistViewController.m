//
//  RegistViewController.m
//  HandworkDemo
//
//  Created by student on 16/9/6.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "RegistViewController.h"

@interface RegistViewController ()
{

    UITextField *_passwordTF;
    UITextField *_phoneTF;
    UITextField *_testTF;
}
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
    _phoneTF=userNameTF;
    
    UITextField *testTF=[UITextField new];
    testTF.borderStyle=UITextBorderStyleRoundedRect;
    testTF.alpha=0.8;
    testTF.placeholder=@"验证码";
    _testTF=testTF;
    
    UIButton *testBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
    [testBtn setTitle:@"获取验证码" forState:(UIControlStateNormal)];
    [testBtn setTitleColor: RedColor forState:(UIControlStateNormal)];
    [testBtn addTarget:self action:@selector(testBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    UITextField *passwordTF=[UITextField new];
    passwordTF.borderStyle=UITextBorderStyleRoundedRect;
    passwordTF.alpha=0.8;
    passwordTF.placeholder=@"密码\t请输入6-16位数字或字母";
    _passwordTF=passwordTF;

    UIButton *eyeBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
    eyeBtn.backgroundColor=[UIColor grayColor];
    [eyeBtn addTarget:self action:@selector(eyeBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    UIButton *registBtn=[UIButton buttonWithType:(UIButtonTypeSystem)];
    registBtn.backgroundColor=RedColor;
    [registBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    registBtn.titleLabel.font=[UIFont systemFontOfSize:20];
    [registBtn setTitle:@"注册" forState:(UIControlStateNormal)];
    [registBtn addTarget:self action:@selector(registBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];

    UILabel *haveCountLB=[UILabel new];
    haveCountLB.textColor=[UIColor whiteColor];
    haveCountLB.adjustsFontSizeToFitWidth=YES;
    haveCountLB.textAlignment=NSTextAlignmentRight;
    haveCountLB.text=@"已有账号，去";
    
    UIButton *loginBtn=[UIButton buttonWithType:(UIButtonTypeSystem)];
    [loginBtn setTitleColor:  RedColor  forState:(UIControlStateNormal)];
    [loginBtn setTitle:@"登录" forState:(UIControlStateNormal)];
    loginBtn.titleLabel.textAlignment=NSTextAlignmentLeft;
    loginBtn .titleLabel.font=haveCountLB.font;
    [loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    UIView *bottomView=[UIView new];
    bottomView.backgroundColor=[UIColor whiteColor];
    
    UIButton*backBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"back"] forState:(UIControlStateNormal)];
    [backBtn addTarget:self action:@selector(backBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view sd_addSubviews:@[userNameTF,testTF,passwordTF,registBtn,haveCountLB,loginBtn,bottomView, testBtn,eyeBtn]];
    [bottomView sd_addSubviews:@[backBtn]];
    
    testTF.sd_layout.centerXEqualToView(self.view).centerYEqualToView(self.view).widthRatioToView(self.view,0.7).heightIs(35);
    
    testBtn.sd_layout.rightSpaceToView(self.view,kMainW*0.15+15).centerYEqualToView(testTF).heightIs(10).widthRatioToView(testTF,0.33);
    
    userNameTF.sd_layout.leftEqualToView(testTF).rightEqualToView(testTF).heightIs(35).bottomSpaceToView(testTF,15);
    
    passwordTF.sd_layout.topSpaceToView(testTF,15).leftEqualToView(testTF).rightEqualToView(testTF).heightIs(35);
    
     eyeBtn.sd_layout.centerYEqualToView(passwordTF).rightSpaceToView(self.view,kMainW*0.15+15).widthIs(20).heightIs(10);
    
    registBtn.sd_layout.topSpaceToView(passwordTF,15).leftEqualToView(passwordTF).rightEqualToView(passwordTF).heightIs(35);
    registBtn.sd_cornerRadiusFromHeightRatio=@0.1;
    
    haveCountLB.sd_layout.leftEqualToView(registBtn).topSpaceToView(registBtn,30).widthRatioToView(registBtn,0.4).heightRatioToView(registBtn,1);
    loginBtn.sd_layout.leftSpaceToView(haveCountLB,0).topEqualToView(haveCountLB).bottomEqualToView(haveCountLB).widthRatioToView(haveCountLB,0.6);
    bottomView.sd_layout.bottomEqualToView(self.view).rightEqualToView(self.view).leftEqualToView(self.view).heightIs(44);
    
    backBtn.sd_layout.centerYEqualToView(bottomView).leftSpaceToView(bottomView,30).heightRatioToView(bottomView,0.5).widthEqualToHeight();
}
//获取验证码
-(void)testBtnClick:(UIButton*)sender
{
    IndicaterStart
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:_phoneTF.text,@"mobile",@"20",@"vid", nil];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [VerifyRequest getDataWithDic:dic withBlock:^(VerifyData *data )
         {
             IndicaterEnd
             Alert(data.info);
            
         } withErrorBlock:^(NSError *error) {
         }];
    });
}
-(void)eyeBtnClick:(UIButton*)sender
{
    _passwordTF.secureTextEntry=!_passwordTF.secureTextEntry;
}
//注册
-(void)registBtnClick:(UIButton*)sender
{
    IndicaterStart
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:@"appstore",@"channel",_testTF.text,@"code", @"7EW8PYES1g66",@"key",_phoneTF.text,@"mobile",_passwordTF.text,@"password",@"ios",@"system",@"20",@"vid", nil];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [RegistRequest getDataWithDic:dic withBlock:^(RegistData *data )
         {
             IndicaterEnd
             Alert(data.info);
         } withErrorBlock:^(NSError *error) {
         }];
    });
}
-(void)loginBtnClick:(UIButton*)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
  
}

@end
