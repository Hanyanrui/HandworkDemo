//
//  AttentionModel.h
//  HandworkDemo
//
//  Created by student on 16/9/6.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AttentionModel : NSObject
@property(nonatomic,copy)NSString *user_id;
@property(nonatomic,copy)NSString *user_name;
@property(nonatomic,copy)NSString *head_daren;
@property(nonatomic,copy)NSString *msgtoid;
@property(nonatomic,copy)NSString *level;
@property(nonatomic,copy)NSString *scores;
@property(nonatomic,copy)NSString *head_pic;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *event_action;
@property(nonatomic,copy)NSString *event_message;
@property(nonatomic,copy)NSString *timeline;
@property(nonatomic,copy)NSString *pmid;
@property(nonatomic,strong)NSArray *course;
@property(nonatomic,strong)NSArray *follow;
@end
