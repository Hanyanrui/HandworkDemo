//
//  GuideViewController.m
//  HandworkDemo
//
//  Created by student on 16/9/2.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "GuideViewController.h"

@interface GuideViewController ()

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatScrollView];
   
    
}
-(void)creatScrollView
{
    UIScrollView *scrollView=[[UIScrollView alloc]initWithFrame:kMainB];
    scrollView.contentSize=CGSizeMake(kMainW*5, kMainH);
    scrollView.pagingEnabled=YES;
    scrollView.bounces=NO;
    scrollView.showsHorizontalScrollIndicator=NO;
    [self.view addSubview:scrollView];
    for (NSInteger i=0; i<5; i++)
    {
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(i*kMainW, 0, kMainW, kMainH)];
        imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"newfeature_0%ld_736@3x.jpg",i+1]];
        imageView.userInteractionEnabled=YES;
        [scrollView addSubview:imageView];
    
    }
    
    UIButton *button=[UIButton buttonWithType:(UIButtonTypeCustom)];
    button.frame=CGRectMake(0, 0, 200, 80);
    button.center=CGPointMake(kMainW/2*9, kMainH-80);
    [button addTarget:self action:@selector(enterImageVCBtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [scrollView addSubview:button];
    

}
-(void)enterImageVCBtnClick:(UIButton*)sender
{
    KeyWindow.rootViewController=[ImageViewController new];
    CATransition *animation=[CATransition animation];
    animation.type=@"rippleEffect";
    animation.duration=1;
    [KeyWindow.layer addAnimation:animation forKey:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
