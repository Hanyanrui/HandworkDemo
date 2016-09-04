//
//  NavigationCell.m
//  HandworkDemo
//
//  Created by student on 16/9/4.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "NavigationCell.h"

@interface NavigationCell ()
{
    UILabel * _nameLb;
}
@end

@implementation NavigationCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    
    if (self=[super initWithCoder:aDecoder])
    {
        [self createView];
    }
    return self;
}

-(void)createView
{
    UIImageView *imageView=[UIImageView new];
    UILabel *nameLb=[UILabel new];
    _nameLb=nameLb;
    _nameLb.textAlignment=NSTextAlignmentCenter;
    _nameLb.textColor=[UIColor grayColor];
    _nameLb.adjustsFontSizeToFitWidth=YES;
    [self addSubview:imageView];
    [self addSubview:nameLb];
    _imageView=imageView;
 
}
-(void)setModel:(NavigationModel *)model
{
    if (_model!=model)
    {
        _model=model;
    }
    if (model.pic)
    {
        [_imageView sd_setImageWithURL:[NSURL URLWithString:model.pic]];
    }
    else
    {
        _imageView.image=[UIImage imageNamed:@"icon_qiandao_"];
    }
    CGFloat width =kMainW/8;
    _imageView.frame=CGRectMake(0, 0, width, width);
    _nameLb.frame=CGRectMake(0, width, width, width/2);
    _nameLb.text=model.name;
    [_nameLb adjustsFontSizeToFitWidth];

}

@end
