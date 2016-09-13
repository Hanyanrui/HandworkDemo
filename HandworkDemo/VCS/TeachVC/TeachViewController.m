//
//  TeachViewController.m
//  HandworkDemo
//
//  Created by student on 16/9/3.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "TeachViewController.h"

@interface TeachViewController ()
{
    CustomScrollView *_scrollView;
    NavigationView *_titleView;
}
@end

@implementation TeachViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=nil;
    [self createNavigationTitleView];
    [self addChildViewControllers];
    self.navigationController.navigationBar.translucent=NO;
}
-(void)createNavigationTitleView
{
 NavigationView *titleView=[[NavigationView alloc]initWithFrame:   CGRectMake(0,0, kMainW/2, 44) withBlock:^(NSInteger index) {
     
     
     [UIView animateWithDuration:0.5 animations:^{
          _scrollView.contentOffset=CGPointMake(kMainW*index, 0);
     }];
     

 }];
    _titleView=titleView;
    self.navigationItem.titleView=titleView;
}
-(void)addChildViewControllers
{
    

    ImageTextViewController *imageTextVC=[ImageTextViewController new];
    VideoViewController *videoVC=[VideoViewController new];
    ZhuanTiViewController *zhuanTiVC=[ZhuanTiViewController new];
    NSMutableArray *vcArr=@[imageTextVC,videoVC,zhuanTiVC].mutableCopy;
    [self addChildViewController:imageTextVC];
    [self addChildViewController:videoVC];
    [self addChildViewController:zhuanTiVC];
    
    CustomScrollView *scrollView=[[CustomScrollView alloc]initWithVCArr:vcArr withBlock:^(NSInteger index) {
      
        [_titleView changeSelectBtnWithIndex:index];
        
    }];
    _scrollView=scrollView;
    [self.view addSubview:scrollView];
    
}



//重写父类方法
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
