//
//  ImageTextRequest.m
//  HandworkDemo
//
//  Created by student on 16/9/12.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "ImageTextRequest.h"

@implementation ImageTextRequest
+(void)getDataWithSort:(NSInteger)sort withTime:(NSInteger)time withStander:(NSInteger)stander withLastId:(NSString*)lastId   withBlock:(ImageTextBlock)block withErrorBlock:(ErrorBlock)failure
{
    NSMutableArray *cateArr=@[@"allcate",@"2",@"6",@"4",@"9",@"10",@"20",@"19",@"12",@"18",@"17",@"1",@"3",@"5",@"7",@"11",@"14",@"15",@"13",@"16",@"8",@"21"].mutableCopy;
    NSMutableArray *orderArr=@[@"hot",@"new",@"comment",@"collect",@"material",@"goods"].mutableCopy;
    NSMutableArray *timeArr=@[@"week",@"month",@"all"].mutableCopy;
    NSString *   url;
    if (lastId) {
        
        if (sort==0)
        {
            url=[NSString stringWithFormat:@"http://m.shougongke.com/index.php?&c=Course&a=newCourseList&gcate=%@&order=%@&pub_time=%@&vid=20&last_id=%@",cateArr[sort],orderArr[stander],timeArr[time],lastId];
        }
        else
        {
        url=[NSString stringWithFormat:@"http://m.shougongke.com/index.php?&c=Course&a=newCourseList&cate_id=%@ &gcate=cate&order=%@&pub_time=%@&vid=20&last_id=%@",cateArr[sort],orderArr[stander],timeArr[time],lastId];
        }
    }
    else
    {
        if (sort==0)
        {
            url=[NSString stringWithFormat:@"http://m.shougongke.com/index.php?&c=Course&a=newCourseList &gcate=%@&order=%@&pub_time=%@&vid=20",cateArr[sort],orderArr[stander],timeArr[time]];
   
        }
        else
        {
            url=[NSString stringWithFormat:@"http://m.shougongke.com/index.php?&c=Course&a=newCourseList&cate_id=%@ &gcate=cate&order=%@&pub_time=%@&vid=20",cateArr[sort],orderArr[stander],timeArr[time]];
        }
    }
   NSString *str = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
   [RequestDataTool get:str params:nil success:^(id responseObj) {
       ImageTextData *data=[ ImageTextData yy_modelWithJSON:responseObj];
       if (block)
       {
           block(data);
       }
       
   } failure:^(NSError *error) {
       NSLog(@"error---%@",error);
   }];
    
    


}
@end
