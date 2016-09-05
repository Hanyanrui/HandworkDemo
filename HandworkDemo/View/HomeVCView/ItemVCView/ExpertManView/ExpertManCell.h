//
//  ExpertManCell.h
//  HandworkDemo
//
//  Created by student on 16/9/5.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonBlock)(NSInteger index);


@interface ExpertManCell : UITableViewCell
@property(nonatomic,strong)DataModel *model;
@property(nonatomic,copy)ButtonBlock block;
@property(nonatomic,strong)UIButton *attentionBtn;
-(void)attentionBtnClick:(ButtonBlock)block;
@end
