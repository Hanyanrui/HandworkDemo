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
    avatarImage.sd_layout.topSpaceToView(self.contentView,10).leftSpaceToView(self.contentView,10).widthRatioToView(self.contentView,0.2).heightEqualToWidth();
   avatarImage.sd_cornerRadiusFromWidthRatio=@0.5;
    
    _avatarImage=avatarImage;

    UILabel *nick_nameLB=[UILabel new];
    nick_nameLB.sd_layout.leftSpaceToView(avatarImage,10).topEqualToView(avatarImage).autoHeightRatio (0);
    _nick_nameLB=nick_nameLB;
    
    UILabel *countLB=[UILabel new];
    countLB.sd_layout.leftEqualToView(nick_nameLB).topSpaceToView(nick_nameLB,10).autoHeightRatio(0);
    countLB.font=[UIFont systemFontOfSize:15];
    _countLB=countLB;
    
    UIImageView *host_picOneImage=[UIImageView new];
    host_picOneImage.sd_layout.topSpaceToView(avatarImage,10).leftEqualToView(self.contentView). widthRatioToView(self.contentView,0.33).heightEqualToWidth();
    _host_picOneImage=host_picOneImage;
    
    UIImageView *host_picTwoImage=[UIImageView new];
    host_picTwoImage.sd_layout.topEqualToView(host_picOneImage).bottomEqualToView(host_picOneImage).widthRatioToView(self.contentView,0.33).centerXEqualToView(self.contentView);
    _host_picTwoImage=host_picTwoImage;
    UIImageView *host_picThreeImage=[UIImageView new];
    host_picThreeImage.sd_layout.topEqualToView(host_picTwoImage).rightEqualToView(self.contentView).bottomEqualToView(self.contentView).widthRatioToView(self.contentView,0.33);
    _host_picThreeImage=host_picThreeImage;
    
    [self.contentView sd_addSubviews:@[avatarImage,nick_nameLB,countLB,host_picOneImage,host_picTwoImage,host_picThreeImage]];
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

}

@end
