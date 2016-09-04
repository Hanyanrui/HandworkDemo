//
//  HotspotCell.m
//  HandworkDemo
//
//  Created by student on 16/9/4.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "HotspotCell.h"

@interface HotspotCell ()
{
    UIImageView *_imageView;
    UILabel *_subjectLB;
}
@end
@implementation HotspotCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
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
    [self addSubview:imageView];
    UILabel *subjectLb=[UILabel new];
    subjectLb.textColor=[UIColor whiteColor];
    [imageView addSubview:subjectLb];
    _imageView=imageView;
    _subjectLB=subjectLb;
}
-(void)setModel:(HotTopicModel *)model
{
    if (_model!=model)
    {
        _model=model;
    }
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.pic]];
    CGFloat height=kMainH/3;
    _imageView.frame=CGRectMake(0, 0, kMainW, height);
    _subjectLB.text=model.subject;
    _subjectLB.frame=CGRectMake(20, height-30, kMainW-40, 20);
}

@end
