//
//  Tools.m
//  LiWuShuoDemo
//
//  Created by student on 16/8/13.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "Tools.h"

@implementation Tools
+(CGFloat)measureSizeWithText:(NSString*)text
{
    CGRect rect=[text boundingRectWithSize:CGSizeMake(100, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]} context:nil];
    return rect.size.width;

}
@end
