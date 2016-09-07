//
//  ExpertManCell.m
//  HandworkDemo
//
//  Created by student on 16/9/5.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "ExpertManCell.h"
@interface ExpertManCell ()
{
    UIImageView *_avatarImage;
    UILabel *_nick_nameLB;
    UILabel *_countLB;
    UIImageView *_host_picOneImage;
    UIImageView *_host_picTwoImage;
    UIImageView *_host_picThreeImage;
}
@end
@implementation ExpertManCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self createSubViews];
    }
    
    return self;
}
-(void)createSubViews
{
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    UIImageView *avatarImage=[UIImageView new];
    _avatarImage=avatarImage;

    UILabel *nick_nameLB=[UILabel new];
    _nick_nameLB=nick_nameLB;
    
    UILabel *countLB=[UILabel new];
    countLB.textColor=[UIColor grayColor];
    countLB.adjustsFontSizeToFitWidth=YES;
    _countLB=countLB;

    
    UIButton *button=[UIButton buttonWithType:(UIButtonTypeCustom)];
    [button addTarget:self action:@selector(guanzhu:) forControlEvents:(UIControlEventTouchUpInside)];
    [button setTitleColor:RedColor forState:(UIControlStateNormal)];
    [button setTitleColor:[UIColor grayColor] forState:(UIControlStateSelected)];
    button.titleLabel.font=[UIFont systemFontOfSize:15];
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    button.layer.cornerRadius=5;
     button.layer.borderWidth=1.5;
    _attentionBtn=button;
    
    
    UIImageView *host_picOneImage=[UIImageView new];
    _host_picOneImage=host_picOneImage;
    
    UIImageView *host_picTwoImage=[UIImageView new];
    _host_picTwoImage=host_picTwoImage;
    
    UIImageView *host_picThreeImage=[UIImageView new];
    _host_picThreeImage=host_picThreeImage;
    
    [self.contentView sd_addSubviews:@[avatarImage,nick_nameLB,countLB,host_picOneImage,host_picTwoImage,host_picThreeImage,button]];
    
    avatarImage.sd_layout.topSpaceToView(self.contentView,10).leftSpaceToView(self.contentView,10).widthRatioToView(self.contentView,0.2).heightEqualToWidth();
    avatarImage.sd_cornerRadiusFromWidthRatio=@0.5;
    
    nick_nameLB.sd_layout.leftSpaceToView(avatarImage,10).widthRatioToView(self.contentView,0.6).topSpaceToView(self.contentView,15);
    
    countLB.sd_layout.leftEqualToView(nick_nameLB).topSpaceToView(nick_nameLB,10).widthRatioToView(self.contentView,0.6);
    
    button.sd_layout.rightSpaceToView(self.contentView,5).centerYEqualToView(avatarImage).widthRatioToView(avatarImage,0.6).heightRatioToView(avatarImage,0.4);
    
     host_picOneImage.sd_layout.topSpaceToView(avatarImage,10).leftEqualToView(self.contentView). widthRatioToView(self.contentView,0.33).heightEqualToWidth();
    
    host_picTwoImage.sd_layout.topEqualToView(host_picOneImage).widthRatioToView(self.contentView,0.33).centerXEqualToView(self.contentView).heightEqualToWidth();
    
    host_picThreeImage.sd_layout.topEqualToView(host_picTwoImage).rightEqualToView(self.contentView).widthRatioToView(self.contentView,0.33).heightEqualToWidth();
    [self setupAutoHeightWithBottomView:host_picOneImage bottomMargin:5];
}
-(void)setModel:(DataModel *)model
{
    if (_model!=model)
    {
        _model=model;
    }
    
    
    [_avatarImage sd_setImageWithURL:[NSURL URLWithString:model.avatar]];
    _nick_nameLB.text=model.nick_name;
    _countLB.text=[NSString stringWithFormat:@"%@图文教程|%@视频教程|%@手工圈",model.course_count,model.video_count,model.opus_count];
    ListModel *model01=model.list[0];
    [_host_picOneImage sd_setImageWithURL:[NSURL URLWithString:model01.host_pic]];
    ListModel *model02=model.list[1];
    [_host_picTwoImage sd_setImageWithURL:[NSURL URLWithString:model02.host_pic]];
    ListModel *model03=model.list[2];
   [_host_picThreeImage sd_setImageWithURL:[NSURL URLWithString:model03.host_pic]];
    _attentionBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
    if ([model.guan_status isEqualToString:@"1"])
    {

        [_attentionBtn setTitle:@"已关注" forState:(UIControlStateNormal)];
        _attentionBtn.layer.borderColor=[[UIColor grayColor] CGColor];
        _attentionBtn.selected=YES;

    }
    else
    {
        [_attentionBtn setTitle:@"+关注" forState:(UIControlStateNormal)];
        _attentionBtn.layer.borderColor=[RedColor CGColor];
        _attentionBtn.selected=NO;
    }
   
}
-(void)guanzhu:(UIButton*)sender
{
    if (_block)
    {
        _block([_model.user_id integerValue]);
    }

}
-(void)attentionBtnClick:(ButtonBlock)block
{
    if (block)
    {
        _block=block;
    }

}
@end
