//
//  HomeViewController.m
//  HandworkDemo
//
//  Created by student on 16/9/3.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "HomeViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
    [self setUpAllViewController];
}
-(void)setUpAllViewController
{
   HandpickViewController *handpickVC=[HandpickViewController new];
   handpickVC.title=@"精选";
    AttentionViewController *attentionVC=[AttentionViewController new];
    attentionVC.title=@"关注";
    ExpertManViewController *experManVC=[ExpertManViewController new];
    experManVC.title=@"达人";
    ActionViewController *actionVC=[ActionViewController new];
    actionVC.title=@"活动";


    [self addChildViewController:handpickVC];
    [self addChildViewController:attentionVC];
    [self addChildViewController:experManVC];
    [self addChildViewController:actionVC];

}
-(void)setUpView
{

    [self setUpTitleEffect:^(UIColor *__autoreleasing *titleScrollViewColor, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor, UIFont *__autoreleasing *titleFont, CGFloat *titleHeight, CGFloat *titleWidth) {
           *titleScrollViewColor = [UIColor whiteColor];
            *norColor = [UIColor lightGrayColor];
            *selColor = RedColor;
        }];
    [self setUpUnderLineEffect:^(BOOL *isUnderLineDelayScroll, CGFloat *underLineH, UIColor *__autoreleasing *underLineColor, BOOL *isUnderLineEqualTitleWidth) {
        *underLineColor=RedColor;
        *isUnderLineEqualTitleWidth=YES;
        
    }];
        [self setUpContentViewFrame:^(UIView *contentView) {
            contentView.frame=CGRectZero;
        }];
 


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
