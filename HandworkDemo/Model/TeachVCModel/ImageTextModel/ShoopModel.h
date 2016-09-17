//
//  ShoopModel.h
//  HandworkDemo
//
//  Created by student on 16/9/13.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShoopModel : NSObject
@property(nonatomic,copy)NSString *price_material;
@property(nonatomic,strong)NSNumber *is_sale_material;
@property(nonatomic,copy)NSString *price_pro;
@property(nonatomic,strong)NSNumber * is_sale_pro;
@end
