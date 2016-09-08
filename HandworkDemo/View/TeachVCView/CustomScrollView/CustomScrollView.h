//
//  CustomScrollView.h
//  HandworkDemo
//
//  Created by student on 16/9/7.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DeceleBlock)(NSInteger index);



@interface CustomScrollView : UIScrollView

@property(nonatomic,copy)DeceleBlock deceleBlock;
-(instancetype)initWithVCArr:(NSArray*)vcArr withBlock:(DeceleBlock)block;

@end
