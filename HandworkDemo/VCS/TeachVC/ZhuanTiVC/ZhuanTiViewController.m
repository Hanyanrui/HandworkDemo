//
//  ZhuanTiViewController.m
//  HandworkDemo
//
//  Created by student on 16/9/7.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "ZhuanTiViewController.h"

@interface ZhuanTiViewController ()

@end

@implementation ZhuanTiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor=[UIColor greenColor];
}
- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    return [self initWithCollectionViewLayout:layout];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
