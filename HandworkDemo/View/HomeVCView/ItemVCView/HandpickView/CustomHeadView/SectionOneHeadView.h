//
//  SectionOneHeadView.h
//  HandworkDemo
//
//  Created by student on 16/9/3.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SectionBlock)(NSInteger);


@interface SectionOneHeadView : UIView
@property(nonatomic,copy)SectionBlock block;
-(instancetype)initWithFrame:(CGRect)frame withImageUrlArr:(NSMutableArray*)urlArr;
-(void)clickImageOfCycleScrollViewWithBlock:(SectionBlock)block;
@end
