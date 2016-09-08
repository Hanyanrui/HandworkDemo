//
//  NavigationView.m
//  HandworkDemo
//
//  Created by student on 16/9/7.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "NavigationView.h"

#define Width self.frame.size.width
#define Height self.frame.size.height
@interface NavigationView ()
{

    NSMutableArray *_btnArr;
}
@end
@implementation NavigationView

-(instancetype)initWithFrame:(CGRect)frame withBlock:(ChooseBlock)block
{
    self=[super initWithFrame:frame];
    
    if (self)
    {
        _chooseBlock=block;
        [self addBtnViews];
    }
    return self;

}
-(void)addBtnViews
{
    NSArray *arr=@[@"图文",@"视频",@"专题"];
    _btnArr=@[].mutableCopy;
    for (int i=0; i<3; i++)
    {
        UIButton *button=[UIButton buttonWithType:(UIButtonTypeCustom)];
        [button setTitle:arr[i] forState:(UIControlStateNormal)];
        button.tag=i;
        [button setTitleColor:[UIColor lightGrayColor] forState:(UIControlStateNormal)];
        [button setTitleColor:[UIColor whiteColor] forState:(UIControlStateSelected)];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:button];
        [_btnArr addObject:button];
    }
    UIButton *picBtn = _btnArr[0];
    picBtn.selected=YES;
    UIButton *videoBtn = _btnArr[1];
    UIButton *subBtn = _btnArr[2];
    
    UIView *leftLineView = [[UIView alloc]init];
    leftLineView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:leftLineView];
    
    UIView *rightLineView = [[UIView alloc]init];
    rightLineView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:rightLineView];
    
    CGFloat W = kMainW/6;
    
    picBtn.sd_layout
    .leftSpaceToView(self,0)
    .bottomSpaceToView(self,0)
    .topSpaceToView(self,0)
    .widthIs(W);
    
    leftLineView.sd_layout
    .leftSpaceToView(picBtn,0)
    .topSpaceToView(self,10)
    .widthIs(1)
    .heightIs(24);
    
    videoBtn.sd_layout
    .topEqualToView(picBtn)
    .bottomEqualToView(picBtn)
    .leftSpaceToView(picBtn,0)
    .widthIs(W);
    
    rightLineView.sd_layout
    .leftSpaceToView(videoBtn,0)
    .topSpaceToView(self,10)
    .widthIs(1)
    .heightIs(24);
    
    subBtn.sd_layout
    .topEqualToView(rightLineView)
    .bottomEqualToView(rightLineView)
    .leftSpaceToView(rightLineView,0)
    .widthIs(W);

}
-(void)buttonClick:(UIButton*)sender
{
    for (UIButton *btn in _btnArr)
    {
        btn.selected=NO;
    }
    sender.selected=YES;
    if (_chooseBlock) {
        _chooseBlock(sender.tag);
    }
}
-(void)changeSelectBtnWithIndex:(NSInteger)index
{
    for (int i=0; i<_btnArr.count; i++)
    {
        UIButton *button=_btnArr[i];
        if (i==index)
        {
            button.selected=YES;
        }
        else
        {
            button.selected=NO;
        }
        
        

    }

}
@end
