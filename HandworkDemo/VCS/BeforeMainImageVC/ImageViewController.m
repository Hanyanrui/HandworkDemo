//
//  ImageViewController.m
//  HandworkDemo
//
//  Created by student on 16/9/2.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()
{
    UIImageView *_imageView;
}
@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createImageView];
    [self performSelector:@selector(enterMainVCBtnClick) withObject:nil afterDelay:1];
    
}
-(void)createImageView
{
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:kMainB];
    imageView.image=[UIImage imageNamed:@"ad.jpg"];
    [self.view addSubview:imageView];
    _imageView=imageView;
}
-(void)enterMainVCBtnClick
{
[UIView animateWithDuration:1 animations:^{
    
    _imageView.transform=CGAffineTransformMakeScale(1.5f, 1.5f);
    _imageView.alpha=0.0f;
} completion:^(BOOL finished) {
    
    KeyWindow.rootViewController=[TabBarViewController new];

}];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}


@end
