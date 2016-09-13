//
//  ImageTextRequest.h
//  HandworkDemo
//
//  Created by student on 16/9/12.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^ImageTextBlock)(ImageTextData*data);
typedef void(^ErrorBlock)(NSError*);
@interface ImageTextRequest : NSObject
+(void)getDataWithSort:(NSInteger)sort withTime:(NSInteger)time withStander:(NSInteger)stander withLastId:(NSString*)lastId   withBlock:(ImageTextBlock)block withErrorBlock:(ErrorBlock)failure;
@end
