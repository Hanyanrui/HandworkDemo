//
//  DataModel.h
//  HandworkDemo
//
//  Created by student on 16/9/5.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface DataModel : NSObject
@property(nonatomic,copy)NSString *user_id;
@property(nonatomic,copy)NSString *nick_name;
@property(nonatomic,copy)NSString *course_time;
@property(nonatomic,copy)NSString *course_count;
@property(nonatomic,copy)NSString *video_count;
@property(nonatomic,copy)NSString *opus_count;
@property(nonatomic,copy)NSString *tb_url;
@property(nonatomic,copy)NSString *is_daren;
@property(nonatomic,copy)NSString *avatar;
@property(nonatomic,copy)NSString *guan_status;
@property(nonatomic,strong)NSArray *list;
@end
