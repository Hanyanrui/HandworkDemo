//
//  ExpertManRequest.h
//  HandworkDemo
//
//  Created by student on 16/9/5.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^ExperManBlock)(ExpertManData*);
@interface ExpertManRequest : NSObject
@property(nonatomic,copy)ExperManBlock block;
+(void)getData:(ExperManBlock)block;
@end
