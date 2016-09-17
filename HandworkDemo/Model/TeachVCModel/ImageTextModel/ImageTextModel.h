//
//  ImageTextModel.h
//  HandworkDemo
//
//  Created by student on 16/9/12.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShoopModel.h"
@interface ImageTextModel : NSObject
@property(nonatomic,copy)NSString *subject;
@property(nonatomic,copy)NSString *hand_id;
@property(nonatomic,copy)NSString *user_id;
@property(nonatomic,copy)NSString *collect;
@property(nonatomic,copy)NSString *view;
@property(nonatomic,copy)NSString *host_pic;
@property(nonatomic,copy)NSString *host_pic_color;
@property(nonatomic,copy)NSString *user_name;
@property(nonatomic,copy)NSString *bg_color;
@property(nonatomic,copy)NSString *last_id;
@property(nonatomic,strong)ShoopModel *shopping;
@end
