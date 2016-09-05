//
//  HandpicRequest.h
//  HandworkDemo
//
//  Created by student on 16/9/4.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HandpickData.h"
typedef void(^HandpicBlock)(HandpickData* );
typedef void(^ErrorBlock)(NSError*);
@interface HandpicRequest : NSObject
@property(nonatomic,copy)HandpicBlock block;
+(void)getData:(HandpicBlock)block withErrorBlock:(ErrorBlock)failure;
@end
