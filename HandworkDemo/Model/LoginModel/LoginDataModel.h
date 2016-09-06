//
//  LoginDataModel.h
//  HandworkDemo
//
//  Created by student on 16/9/6.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginDataModel : NSObject
@property(nonatomic,copy) NSString *uid;
@property(nonatomic,copy) NSString *uname;
@property(nonatomic,copy) NSString *desc;
@property(nonatomic,copy) NSString *gender;
@property(nonatomic,copy) NSString *region;
@property(nonatomic,copy) NSString *hand_daren;
@property(nonatomic,copy) NSString *phone_mob;
@property(nonatomic,copy) NSString *level;
@property(nonatomic,copy) NSString *guan;
@property(nonatomic,copy) NSString *fen;
@property(nonatomic,copy) NSString *score;
@property(nonatomic,copy) NSString *nxet_level_score;
@property(nonatomic,copy) NSString *business;
@property(nonatomic,copy) NSString *avatar;
@property(nonatomic,strong) NSNull *inCircle;
@property(nonatomic,strong) NSArray *unCircle;
@property(nonatomic,copy) NSString *has_sign;
@property(nonatomic,strong) NSNumber *hand_teacher;
@property(nonatomic,copy) NSString *dynamicCount;
@property(nonatomic,copy) NSString *comment;
@property(nonatomic,copy) NSString *replay;
@property(nonatomic,copy) NSString *at;
@property(nonatomic,copy) NSString *circle;
@property(nonatomic,copy) NSString *pm;
@property(nonatomic,copy) NSString *count;
@property(nonatomic,copy) NSString *openIm_id;
@property(nonatomic,copy) NSString *openIm_password;
@end
