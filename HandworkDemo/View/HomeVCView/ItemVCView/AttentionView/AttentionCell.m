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
    UIImageView*_headImageView;
    UIImageView*_guanzhuHeadImageView;
    UILabel *_nameLB;

}
@end
@implementation AttentionCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self creatSubViews];
    }
    
    return self;
    
}
-(void)creatSubViews
{
 
    UIImageView *headImageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, kMainW/10, kMainW/10)];
    headImageView.layer.cornerRadius=kMainW/20;
    headImageView.layer.masksToBounds=YES;
    _headImageView=headImageView;
    
    UIView *bgView=[[UIView alloc]initWithFrame:CGRectMake(20+kMainW/10, kMainW/10+20, kMainW-20-kMainW/10, kMainW/10+20)];
    bgView.backgroundColor=[UIColor lightGrayColor];
    [self.contentView addSubview:bgView];


    
    
    UIImageView *guanzhuHeadImageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, kMainW/10, kMainW/10)];
    guanzhuHeadImageView.layer.cornerRadius=kMainW/20;
    guanzhuHeadImageView.layer.masksToBounds=YES;
    _guanzhuHeadImageView=guanzhuHeadImageView;
    [bgView addSubview:guanzhuHeadImageView];
    
    UIButton *button=[UIButton buttonWithType:(UIButtonTypeCustom)];
    [button setTitle:@"+关注" forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(guanzhu:) forControlEvents:(UIControlEventTouchUpInside)];
    [button setTitleColor:RedColor forState:(UIControlStateNormal)];
    [button setTitleColor:[UIColor grayColor] forState:(UIControlStateSelected)];
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    button.layer.cornerRadius=5;
    button.layer.borderWidth=1.5;
    button.bounds=CGRectMake(0, 0, kMainW/8, kMainW/10);
    button.center=CGPointMake(kMainW*15/16-(20+kMainW/10)-10, guanzhuHeadImageView.center.y);
    [bgView addSubview:button];
    UILabel *nameLB=[[UILabel alloc]initWithFrame:CGRectMake(20+kMainW/10, 20, kMainW-20-kMainW/10, kMainW/15)];
    _nameLB=nameLB;
    [self addSubview:headImageView];
    [self addSubview:nameLB];
    
    

}
-(void)setModel:(AttentionModel *)model
{
    if (_model!=model)
    {
        _model=model;
    }
    [_headImageView sd_setImageWithURL:[NSURL URLWithString:model.head_pic]];
    
    if ([model.event_message isEqualToString:@""] ) {
         _nameLB.text=[NSString stringWithFormat:@"%@%@",model.user_name,model.event_action];
    }
    else
    {
        _nameLB.text=[NSString stringWithFormat:@"%@%@:%@",model.user_name,model.event_action,model.event_message];
    }
    
    if ([model.type isEqualToString:@"follow"])
    {
        FollowModel*model01=  model.follow[0];
        [_guanzhuHeadImageView sd_setImageWithURL:[NSURL URLWithString:model01.head_pic]];
    }
    
    
    
    
    
    

}

@end
