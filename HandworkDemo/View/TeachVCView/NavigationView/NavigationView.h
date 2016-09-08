//
//  NavigationView.h
//  HandworkDemo
//
//  Created by student on 16/9/7.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ChooseBlock)(NSInteger index);

@interface NavigationView : UIView
@property(nonatomic,copy)ChooseBlock chooseBlock;
@property(nonatomic,strong)NSMutableArray *btnArray;

-(instancetype)initWithFrame:(CGRect)frame withBlock:(ChooseBlock)block;
-(void)changeSelectBtnWithIndex:(NSInteger)index;
@end
