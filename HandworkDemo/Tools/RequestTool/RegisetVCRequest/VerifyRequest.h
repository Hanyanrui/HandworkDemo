//
//  RegistRequest.h
//  HandworkDemo
//
//  Created by student on 16/9/6.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^VerifyBlock)(VerifyData*);
typedef void(^ErrorBlock)(NSError*);
@interface VerifyRequest : NSObject
+(void)getDataWithDic:(NSDictionary*)dic withBlock:(VerifyBlock)block withErrorBlock:(ErrorBlock)failure;
@end
