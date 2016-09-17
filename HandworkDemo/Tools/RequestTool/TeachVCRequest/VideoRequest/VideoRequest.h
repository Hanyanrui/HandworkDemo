//
//  VideoRequest.h
//  HandworkDemo
//
//  Created by student on 16/9/13.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^VideoBlock)(VideoData*data);
typedef void(^ErrorBlock)(NSError*);
@interface VideoRequest : NSObject

+(void)getDataWithCate:(NSInteger)cate withPrice:(NSInteger)price withSort:(NSInteger)sort withPage:(NSString*)page   withBlock:(VideoBlock)block withErrorBlock:(ErrorBlock)failure;
@end
