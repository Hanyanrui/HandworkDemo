//
//  AttentionCell.m
//  HandworkDemo
//
//  Created by student on 16/9/6.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "AttentionCell.h"
@interface AttentionCell()
{
    UIView *_bgView;
    UIImageView*_headImageView;
    UIImageView*_guanzhuHeadImageView;
    UILabel *_nameLB;
    UIButton *_guanzhuBtn;
    UIImageView *_courseImage;
    UILabel *_zhutiNameLB;
    UILabel *_courseUserNameLB;
    UILabel *_timeLB;
    UIView *_lineView;
    

}
@end
@implementation AttentionCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        self.backgroundColor=[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
        [self creatSubViews];
    }
    return self;
}
-(void)creatSubViews
{
 
    UIView *lineView=[UIView new];
    lineView.backgroundColor=[UIColor grayColor];
    [self.contentView addSubview:lineView];
    _lineView=lineView;
    
    UIImageView *headImageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, kMainW/10, kMainW/10)];
    headImageView.layer.cornerRadius=kMainW/20;
    headImageView.layer.masksToBounds=YES;
    _headImageView=headImageView;
    
    UIView *bgView=[UIView new];
    bgView.backgroundColor=[UIColor whiteColor];
    [self.contentView addSubview:bgView];
    _bgView=bgView;

    UIImageView *courseImage=[UIImageView new];
    _courseImage=courseImage;
    [bgView addSubview:courseImage];
    
    
    
    UIImageView *guanzhuHeadImageView=[UIImageView new];    _guanzhuHeadImageView=guanzhuHeadImageView;
    [bgView addSubview:guanzhuHeadImageView];
    
    
    UILabel *zhutiNameLB=[UILabel new];
    zhutiNameLB.textColor=[UIColor grayColor];
    zhutiNameLB.font=[UIFont systemFontOfSize:15];
    zhutiNameLB.numberOfLines=0;
    _zhutiNameLB=zhutiNameLB;
   
    [bgView addSubview:zhutiNameLB];
    
    UILabel *courseUserNameLB=[UILabel new];
    _courseUserNameLB=courseUserNameLB;
    [bgView addSubview:courseUserNameLB];
    
    UILabel *timeLb=[UILabel new];
    timeLb.textColor=[UIColor grayColor];
    timeLb.font=[UIFont systemFontOfSize:12];
    _timeLB=timeLb;
    [self.contentView addSubview:timeLb];
    
    
    UIButton *button=[UIButton buttonWithType:(UIButtonTypeCustom)];
    [button addTarget:self action:@selector(guanzhu:) forControlEvents:(UIControlEventTouchUpInside)];
    [button setTitleColor:RedColor forState:(UIControlStateNormal)];
    [button setTitleColor:[UIColor grayColor] forState:(UIControlStateSelected)];
    button.titleLabel.font=[UIFont systemFontOfSize:15];
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    button.layer.cornerRadius=5;
    button.layer.borderWidth=1.5;
    [bgView addSubview:button];
    _guanzhuBtn=button;
    
    UILabel *nameLB=[[UILabel alloc]initWithFrame:CGRectMake(20+kMainW/10, 20, kMainW-20-kMainW/10, kMainW/15)];
    _nameLB=nameLB;
    [self.contentView addSubview:headImageView];
    [self.contentView addSubview:nameLB];
    
    
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changePage:)];
    [bgView addGestureRecognizer:tap];
    

}
-(void)setModel:(AttentionModel *)model
{
    if (_model!=model)
    {
        _model=model;
    }
    [_headImageView sd_setImageWithURL:[NSURL URLWithString:model.head_pic]];
    _lineView.frame=CGRectMake(10+kMainW/20, 0, 1, self.frame.size.height);
    
    if ([model.type isEqualToString:@"follow"])
    {
        FollowModel*model01=  [model.follow firstObject];
        _bgView.frame=CGRectMake(20+kMainW/10, kMainW/10+20, kMainW-20-kMainW/10, kMainW/10+20);
        
        _nameLB.text=[NSString stringWithFormat:@"%@%@",model.user_name,model.event_action];
        
        _nameLB.text=[NSString stringWithFormat:@"%@%@%@",model.user_name,model.event_action,model.event_message];
        
        [_guanzhuHeadImageView sd_setImageWithURL:[NSURL URLWithString:model01.head_pic]];
        _guanzhuHeadImageView.frame=CGRectMake(10, 10, kMainW/10, kMainW/10);
        _guanzhuHeadImageView.layer.cornerRadius=kMainW/20;
        _guanzhuHeadImageView.layer.masksToBounds=YES;
        
        _guanzhuBtn.bounds=CGRectMake(0, 0, kMainW/8, kMainW/10);
        _guanzhuBtn.center=CGPointMake(kMainW*15/16-(20+kMainW/10)-10, _guanzhuHeadImageView.center.y);
        
        
        _courseUserNameLB.frame=CGRectMake(kMainW/10+20,(kMainW/10-15)/2, kMainW/2,30);
        _courseUserNameLB.text=model01.user_name;
        
        _courseImage.frame=CGRectZero;
        _zhutiNameLB.frame=CGRectZero;
        
        if ([model01.follow_status isEqualToString:@"1"])
        {
            [_guanzhuBtn setTitle:@"已关注" forState:(UIControlStateNormal)];
            _guanzhuBtn.layer.borderColor=[[UIColor grayColor] CGColor];
            _guanzhuBtn.selected=YES;
            
        }
        else
        {
            [_guanzhuBtn setTitle:@"+关注" forState:(UIControlStateNormal)];
            _guanzhuBtn.layer.borderColor=[RedColor CGColor];
            _guanzhuBtn.selected=NO;
        }
    }
    else if ([model.type isEqualToString:@"course"])
    {
        CourseModel *model01=[model.course firstObject];
        _bgView.frame=CGRectMake(20+kMainW/10, kMainW/10+20, kMainW *9/10-20 , kMainW/5+20);
        
        _courseImage.frame=CGRectMake(10, 10, kMainW/5, kMainW/5);
        [_courseImage sd_setImageWithURL:[NSURL URLWithString:model01.host_pic]];
        
        _nameLB.text=[NSString stringWithFormat:@"%@%@%@",model.user_name,model.event_action,model.event_message];
        
        _zhutiNameLB.text=model01.zhuti;
        _zhutiNameLB.frame=CGRectMake(20+kMainW/5, 10, kMainW*7/10-40, kMainW/5+20-kMainW/12);
        
        [_guanzhuHeadImageView sd_setImageWithURL:[NSURL URLWithString:model01.head_pic]];
        _guanzhuHeadImageView.frame=CGRectMake(kMainW *9/10-30-kMainW/12, kMainW/5+10-kMainW/12, kMainW/12, kMainW/12);
        _guanzhuHeadImageView.layer.cornerRadius=kMainW/20;
        _guanzhuHeadImageView.layer.masksToBounds=YES;
        CGFloat length=[Tools measureSizeWithText:model01.user_name];
        
        _courseUserNameLB.frame=CGRectMake(kMainW *9/10-25-kMainW/12-length, kMainW/5+10-kMainW/12, length, kMainW/12);
        _courseUserNameLB.text=model01.user_name;
        
        _guanzhuBtn.frame=CGRectZero;
        
    }
    else
    {
        CircleModel *model01=[model.circle firstObject];
        _bgView.frame=CGRectMake(20+kMainW/10, kMainW/10+20, kMainW *9/10-20 , kMainW/5+20);
        
        _courseImage.frame=CGRectMake(10, 10, kMainW/5, kMainW/5);
        [_courseImage sd_setImageWithURL:[NSURL URLWithString:model01.host_pic]];
        
        _zhutiNameLB.text=model01.message;
        _zhutiNameLB.numberOfLines=0;
        _zhutiNameLB.frame=CGRectMake(20+kMainW/5, 10, kMainW*7/10-40, kMainW/5+20-kMainW/12);
        
        [_guanzhuHeadImageView sd_setImageWithURL:[NSURL URLWithString:model01.head_pic]];
        _guanzhuHeadImageView.frame=CGRectMake(kMainW *9/10-30-kMainW/12, kMainW/5+10-kMainW/12, kMainW/12, kMainW/12);
        _guanzhuHeadImageView.layer.cornerRadius=kMainW/20;
        _guanzhuHeadImageView.layer.masksToBounds=YES;
        CGFloat length=[Tools measureSizeWithText:model01.username];
        
        _courseUserNameLB.frame=CGRectMake(kMainW *9/10-25-kMainW/12-length, kMainW/5+10-kMainW/12, length, kMainW/12);
        _courseUserNameLB.text=model01.username;
        
        _guanzhuBtn.frame=CGRectZero;
    }

    _timeLB.frame=CGRectMake(20+kMainW/10, _bgView.frame.origin.y+_bgView.frame.size.height+5, kMainW/2, 20);
    _timeLB.text=model.timeline;

}
-(void)guanzhu:(UIButton*)sender
{
    if (_guanzhu)
    {
        _guanzhu([[[_model.follow firstObject] user_id]intValue]);
    }

}
-(void)changePage:(UITapGestureRecognizer*)tap
{
    if ([_model.type isEqualToString:@"circle"])
    {
        if (_changePage)
        {
            _changePage([[[_model.circle firstObject] circle_id]integerValue] );
        }
    }
    else if ([_model.type isEqualToString:@"course"])
    {
     _changePage([[[_model.course firstObject] hand_id]integerValue] );
    
    
    }
    
    
    
    
}
-(void)guanzhuBtnClickWithBlock:(ClickBlock)block
{
    if (block)
    {
        _guanzhu=block;
    }
}
-(void)changePageWithBlock:(ClickBlock)block;
{

    if (block)
    {
        _changePage=block;
    }

}
@end
