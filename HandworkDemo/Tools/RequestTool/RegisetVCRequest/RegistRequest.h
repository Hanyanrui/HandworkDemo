//
//  RegistRequest.h
//  HandworkDemo
//
//  Created by student on 16/9/6.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^RegistBlock)(RegistData*);
typedef void(^ErrorBlock)(NSError*);
@interface RegistRequest : NSObject
+(void)getDataWithDic:(NSDictionary*)dic withBlock:(RegistBlock)block withErrorBlock:(ErrorBlock)failure;
@end
