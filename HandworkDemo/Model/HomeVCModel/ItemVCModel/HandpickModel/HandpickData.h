//
//  HandpickData.h
//  HandworkDemo
//
//  Created by student on 16/9/4.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MembersOpendModel.h"
@interface HandpickData : NSObject
@property(nonatomic,strong)NSArray* slide;
@property (nonatomic,strong)NSArray *navigation;
@property (nonatomic,strong)NSArray *advance;
@property (nonatomic,strong)NSArray *hotTopic;
@property (nonatomic,strong)MembersOpendModel* membersOpened;
@end
