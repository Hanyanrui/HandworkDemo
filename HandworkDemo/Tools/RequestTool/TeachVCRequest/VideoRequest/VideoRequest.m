//
//  VideoRequest.m
//  HandworkDemo
//
//  Created by student on 16/9/13.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "VideoRequest.h"

@implementation VideoRequest
+(void)getDataWithCate:(NSInteger)cate withPrice:(NSInteger)price withSort:(NSInteger)sort withPage:(NSString*)page   withBlock:(VideoBlock)block withErrorBlock:(ErrorBlock)failure
{
   NSMutableArray *cateArr=@[@"0",@"2",@"6",@"4",@"9",@"10",@"20",@"19",@"12",@"18",@"17",@"1",@"3",@"5",@"7",@"11",@"14",@"15",@"13",@"16",@"8",@"21"].mutableCopy;
    NSMutableArray *priceArr=@[@"0",@"1",@"3"].mutableCopy;
    NSMutableArray *sortArr=@[@"1",@"9",@"7",@"3",@"4"].mutableCopy;
    NSString *url=  [ NSString stringWithFormat:@"http://m.shougongke.com/index.php?c=Handclass&a=videoList&cate=%@&page=%@&price=%@&sort=%@&vid=20",cateArr[cate],page,priceArr[price],sortArr[sort]];
    
    NSString *str = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    [RequestDataTool get:str params:nil success:^(id responseObj) {
        VideoData *data=[VideoData yy_modelWithJSON:responseObj];
        if (block)
        {
            block(data);
        }
        
    } failure:^(NSError *error) {
        NSLog(@"error---%@",error);
    }];


}
@end
