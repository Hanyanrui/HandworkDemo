//
//  VideoCell.m
//  HandworkDemo
//
//  Created by student on 16/9/17.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "VideoCell.h"
@interface VideoCell ()
{
    UIImageView *_imageView;
    UILabel *_suggestLB;
    UILabel *_bottomLB;





}

@end

@implementation VideoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        [self createSubViews];
    }
    
    
    return self;
    
}
-(void)createSubViews
{
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 0, kMainW-20, kMainH/3)];
    imageView.layer.cornerRadius=5;
    imageView.layer.masksToBounds=YES;
    [self.contentView addSubview:imageView];
    _imageView=imageView;

    UILabel *suggestLB=[[UILabel alloc]init];
    suggestLB.backgroundColor=RedColor;
    suggestLB.textAlignment=NSTextAlignmentCenter;
    suggestLB.textColor=[UIColor whiteColor];
    [self.contentView addSubview:suggestLB];
    _suggestLB=suggestLB;
 
    UILabel *bottomLB=[[UILabel alloc]initWithFrame:CGRectMake(20, kMainH/3-30, kMainW, 30)];
    bottomLB.textColor=[UIColor whiteColor];
    [self.contentView addSubview:bottomLB];
    _bottomLB=bottomLB;





}
-(void)setModel:(VideoModel *)model
{
    if (_model!=model)
    {
        _model=model;
    }

    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.host_pic]];
    
    if ([model.suggest isEqualToString:@"1"])
    {
        _suggestLB.frame=CGRectMake(kMainW-90, 10, 80, 30);
         _suggestLB.text=@"小编推荐";
    }
    else
    {
        _suggestLB.frame=CGRectZero;
    }
    _bottomLB.text=[NSString stringWithFormat:@"%@",model.subject];
 
    
    
    
   

}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
