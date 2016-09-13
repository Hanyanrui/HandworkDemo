//
//  ImageTextCell.m
//  HandworkDemo
//
//  Created by student on 16/9/12.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "ImageTextCell.h"

@interface ImageTextCell ()
{
    UIImageView *_imageView;
    UIView *_bgView;
    UILabel *_subjectLB;
    UILabel *_user_nameLB;
    UILabel *_buttomLB;
    

}
@end
@implementation ImageTextCell

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self=[super initWithCoder:aDecoder];
    if (self)
    {
        [self createSubViews];
    }



    return self;
}
-(void)createSubViews
{
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, (kMainW-30)/2, kMainH*2/4 *3/5)];
    imageView.backgroundColor=[UIColor grayColor];
    [self addSubview:imageView];
    _imageView=imageView;
    CGFloat height=kMainH*2/4 *2/5;
    UIView *bgView=[[UIView alloc]initWithFrame:CGRectMake(0, kMainH*2/4 *3/5, (kMainW-30)/2, height)];
    [self addSubview:bgView];
    _bgView=bgView;
    
    
    UILabel *subjectLB=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, (kMainW-30)/2-10,  height/3)];
    subjectLB.numberOfLines=0;
    subjectLB.adjustsFontSizeToFitWidth=YES;
    subjectLB.textColor=[UIColor whiteColor];
    [bgView addSubview:subjectLB];
    _subjectLB=subjectLB;
    
    UILabel *userLB=[[UILabel alloc]initWithFrame:CGRectMake(10, height/3, (kMainW-30)/2-10, height/3)];
    [bgView addSubview:userLB];
    userLB.textColor=[UIColor grayColor];
    _user_nameLB=userLB;
  
    
    
    UILabel *bottomLB=[[UILabel alloc]initWithFrame:CGRectMake(10,height/3*2, (kMainW-30)/2-10, height/3)];
    [bgView addSubview:bottomLB];
    bottomLB.textColor=[UIColor grayColor];
   _buttomLB=userLB;
    

}
-(void)setModel:(ImageTextModel *)model
{
    if (_model!=model) {
        _model=model;
    }
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.host_pic]];
    _bgView.backgroundColor=[UIColor colorWithHexString:model.bg_color];
    _subjectLB.text=model.subject;
    _user_nameLB.text=[NSString stringWithFormat:@"by %@",model.user_name];
    _buttomLB.text=[NSString stringWithFormat:@"%@人气/%@收藏",model.view,model.collect];
}
@end
