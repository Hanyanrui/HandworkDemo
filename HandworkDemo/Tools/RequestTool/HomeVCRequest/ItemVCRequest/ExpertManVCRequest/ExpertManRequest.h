//
//  ExpertManRequest.h
//  HandworkDemo
//
//  Created by student on 16/9/5.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^ExperManBlock)(ExpertManData*);
typedef void(^ErrorBlock)(NSError*);
@interface ExpertManRequest : NSObject
@property(nonatomic,copy)ExperManBlock block;
+(void)getDataWithDic:(NSDictionary*)dic withBlock:(ExperManBlock)block withErrorBlock:(ErrorBlock)failure;
@end
