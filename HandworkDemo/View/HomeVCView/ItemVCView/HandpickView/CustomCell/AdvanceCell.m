//
//  AdvanceCell.m
//  HandworkDemo
//
//  Created by student on 16/9/4.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "AdvanceCell.h"
@interface AdvanceCell ()
{
    UIImageView  *_imageView;
}
@end
@implementation AdvanceCell

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
    _imageView=imageView;
}
-(void)setModel:(AdvanceModel *)model
{
    if (_model!=model)
    {
        _model=model;
    }
    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.pic]];
    CGFloat height=kMainH/4;
    CGFloat width=(kMainW-5)/2;
    _imageView.frame=CGRectMake(0, 0, width, height);
}


@end
