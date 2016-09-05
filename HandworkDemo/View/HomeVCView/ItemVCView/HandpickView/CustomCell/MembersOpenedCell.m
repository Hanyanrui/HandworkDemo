//
//  MembersOpenedCell.m
//  HandworkDemo
//
//  Created by student on 16/9/4.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "MembersOpenedCell.h"
@interface MembersOpenedCell ()
{

    UIImageView *_imageView;
}
@end

@implementation MembersOpenedCell

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
    [self addSubview:imageView];
    _imageView=imageView;
}
-(void)setModel:(MembersOpendModel *)model
{
    if (_model!=model)
    {
        _model=model;
    }
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.url]];
     CGFloat height=kMainW/[model.width floatValue] *[model.height floatValue];
    _imageView.frame=CGRectMake(0, 0, kMainW, height);
}

@end
