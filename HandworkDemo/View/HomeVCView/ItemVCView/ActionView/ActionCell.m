//
//  ActionCell.m
//  HandworkDemo
//
//  Created by student on 16/9/5.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "ActionCell.h"
@interface ActionCell ()
{
    UIImageView *_logoImageView;
    UILabel * _sujectLB;
    UILabel *_stausLB;
}
@end
@implementation ActionCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self createSubviews];
    }
    return self;
    
}
-(void)createSubviews
{
    UIImageView *imageView=[UIImageView new];
    _logoImageView=imageView;
    [self.contentView addSubview:imageView];
    
    UILabel *subjectLB=[UILabel new];
    subjectLB.font=[UIFont systemFontOfSize:15];
    subjectLB.textColor=[UIColor grayColor];
    subjectLB.numberOfLines=0;
    [self.contentView addSubview:subjectLB];
    _sujectLB=subjectLB;
    
    UILabel* statusLB=[UILabel new];
    statusLB.textAlignment=NSTextAlignmentCenter;
    statusLB.font=[UIFont systemFontOfSize:15];
    [self.contentView addSubview:statusLB];
    _stausLB=statusLB;
    
}
-(void)setModel:(ActionModel *)model
{
    if (_model!=model)
    {
        _model=model;
    }
    NSLog(@"%@",model.width);
    CGFloat height=kMainW/[model.width floatValue]*[model.height floatValue];
    _logoImageView.frame=CGRectMake(0, 0, kMainW, height);
    [_logoImageView sd_setImageWithURL:[NSURL URLWithString:model.m_logo]];
    
    _sujectLB.frame=CGRectMake(10, height, kMainW*4/5, kMainW/8);
    _sujectLB.text=[NSString stringWithFormat:@"%@\n征集作品时间:%@",model.c_name,model.c_time];
    _stausLB.frame=CGRectMake(kMainW*4/5, height+kMainW/32, kMainW/5, kMainW/16);
    if ([model.c_status isEqualToString:@"1"])
    {
        _stausLB.text=@"进行中";
    }
    else if ([model.c_status isEqualToString:@"0"])
    {
      _stausLB.text=@"即将开始";
    }
    else
    {
     _stausLB.text=@"已结束";

    }
    
    
    
    
    
    
    
    
    
}
@end
