//
//  AttentionCell.h
//  HandworkDemo
//
//  Created by student on 16/9/6.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickBlock)(NSInteger index);



@interface AttentionCell : UITableViewCell
@property(nonatomic,strong)AttentionModel *model;
@property(nonatomic,copy)ClickBlock guanzhu;
@property(nonatomic,copy)ClickBlock changePage;
-(void)guanzhuBtnClickWithBlock:(ClickBlock)block;
-(void)changePageWithBlock:(ClickBlock)block;
@end
