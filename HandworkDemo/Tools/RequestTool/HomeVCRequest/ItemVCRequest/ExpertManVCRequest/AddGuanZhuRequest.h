//
//  AddGuanZhuRequest.h
//  HandworkDemo
//
//  Created by student on 16/9/7.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^AddGuanZhuBlock)(AddGuanZhuData*);
typedef void(^ErrorBlock)(NSError*);

@interface AddGuanZhuRequest : NSObject
+(void)getDataWithDic:(NSDictionary*)dic withBlock:(AddGuanZhuBlock)block withErrorBlock:(ErrorBlock)failure;
@end
