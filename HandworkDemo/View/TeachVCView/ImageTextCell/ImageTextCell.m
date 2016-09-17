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
    self.contentView.layer.cornerRadius=5;
    self.contentView.layer.masksToBounds=YES;
    
    CGFloat width =(kMainW-30)/2;

    
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width,width)];;
    [self.contentView addSubview:imageView];
    _imageView=imageView;
    
   
    UILabel *priceLB=[[UILabel alloc]init];
    priceLB.backgroundColor=RedColor;
    priceLB.textColor=[UIColor whiteColor];
    priceLB.layer.cornerRadius=15;
    priceLB.layer.masksToBounds=YES;
    [self.contentView addSubview:priceLB];
    _priceLB=priceLB;
    
    
    UIView *bgView=[[UIView alloc]initWithFrame:CGRectMake(0, width,width, width/2)];
    [self.contentView addSubview:bgView];
    _bgView=bgView;
    
    
    UILabel *subjectLB=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, width,  width/6)];
    subjectLB.numberOfLines=0;
    subjectLB.adjustsFontSizeToFitWidth=YES;
    subjectLB.textColor=[UIColor whiteColor];
    [bgView addSubview:subjectLB];
    _subjectLB=subjectLB;
    

    UILabel *userLB=[[UILabel alloc]initWithFrame:CGRectMake(10, width/6, width, width/6)];
    [bgView addSubview:userLB];
    userLB.textColor=[UIColor grayColor];
    _user_nameLB=userLB;
  
    UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(10, width/3, width-20, 1)];
    lineView.backgroundColor=[UIColor grayColor];
    [bgView addSubview:lineView];
    
    
    UILabel *bottomLB=[[UILabel alloc]initWithFrame:CGRectMake(10,width/3, width, width/6)];
    bottomLB.textColor=[UIColor grayColor];
    [bgView addSubview:bottomLB];
    _buttomLB=bottomLB;
    
   
    

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
    _priceLB.text=[NSString stringWithFormat:@"  ¥%@",model.shopping.price_pro];

}
@end
