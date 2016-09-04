//
//  RequestDataTool.h
//  HandworkDemo
//
//  Created by student on 16/9/4.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestDataTool : NSObject
+(void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *))failure;
+(void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *))failure;
@end
