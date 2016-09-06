//
//  LoginRequest.h
//  HandworkDemo
//
//  Created by student on 16/9/6.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^LoginBlock)(LoginData*);
typedef void(^ErrorBlock)(NSError*);
@interface LoginRequest : NSObject
+(void)getDataWithDic:(NSDictionary*)dic withBlock:(LoginBlock)block withErrorBlock:(ErrorBlock)failure;
@end
