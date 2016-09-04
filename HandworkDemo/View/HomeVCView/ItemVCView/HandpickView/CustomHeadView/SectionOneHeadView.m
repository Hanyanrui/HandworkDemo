//
//  SectionOneHeadView.m
//  HandworkDemo
//
//  Created by student on 16/9/3.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "SectionOneHeadView.h"
@interface SectionOneHeadView ()<SDCycleScrollViewDelegate>
@property(nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation SectionOneHeadView

-(instancetype)initWithFrame:(CGRect)frame withImageUrlArr:(NSMutableArray*)urlArr
{
    
    if (self=[super initWithFrame:frame])
    {
        self.dataArr=urlArr;
        [self createCycleScrollView];
    }
    return self;
}
-(void)createCycleScrollView
{
    
    NSMutableArray *picArr=@[].mutableCopy;
    for (SlideModel *model in self.dataArr)
    {
        [picArr addObject:model.host_pic];

    }
    SDCycleScrollView *cycleScrollView=[SDCycleScrollView cycleScrollViewWithFrame:self.frame delegate:self placeholderImage:nil];
    cycleScrollView.currentPageDotColor=RedColor;
    cycleScrollView.imageURLStringsGroup=picArr;
    [self addSubview:cycleScrollView];
}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    if (_block)
    {
        _block(index);
    }
    
}
-(void)clickImageOfCycleScrollViewWithBlock:(SectionBlock)block
{

        _block=block;
}
@end
