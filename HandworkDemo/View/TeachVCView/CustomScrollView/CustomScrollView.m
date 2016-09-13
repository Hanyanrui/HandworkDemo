//
//  CustomScrollView.m
//  HandworkDemo
//
//  Created by student on 16/9/7.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "CustomScrollView.h"
@interface CustomScrollView ()<UIScrollViewDelegate>
{
    NSArray *_vcArr;
    NSInteger _newIndex;
}
@end
@implementation CustomScrollView
-(instancetype)initWithVCArr:(NSArray*)vcArr withBlock:(DeceleBlock)block;
{
    self=[super initWithFrame:kMainB];
    if (self)
    {
        _vcArr=vcArr;
        [self createSubViews];
     
        if (block) {
            _deceleBlock=block;
        }
        
    }
    return self;
}
-(void)changeViewControllerWithIndex:(NSInteger)index
{



}
-(void)createSubViews
{
    self.pagingEnabled=YES;
    self.bounces=NO;
    self.contentSize=CGSizeMake(kMainW*_vcArr.count, kMainH-104);
    self.showsVerticalScrollIndicator=NO;
    self.showsHorizontalScrollIndicator=NO;
    self.delegate=self;
    for (int i=0; i<_vcArr.count; i++)
    {
        UIViewController *vc=_vcArr[i];
        vc.view.frame=CGRectMake(kMainW*i, 0, kMainW, kMainH);
        [self addSubview:vc.view];
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{

    NSInteger index=scrollView.contentOffset.x/kMainW;
    if (_newIndex!=index)
    {
        if (_deceleBlock)
        {
            _deceleBlock(index);
        }
    }
       _newIndex=index;

}
@end
