//
//  SectionOneHeadView.m
//  HandworkDemo
//
//  Created by student on 16/9/3.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "SectionOneHeadView.h"

@implementation SectionOneHeadView

-(instancetype)initWithFrame:(CGRect)frame
{

    if (self=[super initWithFrame:frame])
    {
        [self createCycleScrollView];
    }
    return self;
}
-(void)createCycleScrollView
{
    SDCycleScrollView *cycleScrollView=[SDCycleScrollView cycleScrollViewWithFrame:self.frame delegate:self placeholderImage:nil];
    
    
    

}
@end
