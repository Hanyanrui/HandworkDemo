//
//  ImageTextViewController.m
//  HandworkDemo
//
//  Created by student on 16/9/7.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "ImageTextViewController.h"

@interface ImageTextViewController ()<DOPDropDownMenuDelegate,DOPDropDownMenuDataSource>

@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)NSMutableArray *allSortTitleArr;
@property(nonatomic,strong)NSMutableArray *allSortImageArr;
@property(nonatomic,strong)NSMutableArray *timeTitleArr;
@property(nonatomic,strong)NSMutableArray *timeImageArr;
@property(nonatomic,strong)NSMutableArray *standardTitleArr;
@property(nonatomic,strong)NSMutableArray *standardImageArr;
@end

@implementation ImageTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
    self.collectionView.backgroundColor=[UIColor redColor];
     [self creatDownMenuView];
//    DropDownView *view=[[DropDownView alloc]initWithOrigin:CGPointMake(0, 0) andHeight:100];
//    view.backgroundColor=[UIColor grayColor];
//    [self.view addSubview:view];
    
    
}



- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    return [self initWithCollectionViewLayout:layout];
}
-(NSMutableArray*)allSortTitleArr
{
    if (_allSortTitleArr)
    {
        _allSortTitleArr=@[@"全部分类",@"皮艺",@"编织",@"木艺",@"模型",@"橡皮章",@"园艺多肉",@"全部分类",@"全部分类",@"全部分类",@"全部分类",@"全部分类",@"全部分类",@"全部分类",@"手工护肤",@"旧物改造",@"电子科技",@"金属工艺",@"全部分类",@"布艺",@"纸艺",@"饰品",@"刺绣",@"羊毛毡",@"黏土陶艺",@"手工印染",@"美食烘焙",@"滴胶热缩",@"雕塑雕刻",@"其他"].mutableCopy;
    }
    return _allSortTitleArr;
}
-(NSMutableArray *)timeTitleArr
{
    
    if (_timeTitleArr)
    {
        _timeTitleArr=@[@"一周",@"一月",@"全部教程"].mutableCopy;
    }
    return _timeTitleArr;
}
-(NSMutableArray*)standardTitleArr
{
    if (_standardTitleArr)
    {
        _standardTitleArr=@[@"最热教程",@"最新跟新",@"评论最多",@"收藏最多",@"材料包有售",@"成品有售"].mutableCopy;
    }
    return _standardTitleArr;
}
-(NSMutableArray *)dataArr
{
    if (_dataArr)
    {
        _dataArr=@[_allSortTitleArr,_timeTitleArr,_standardTitleArr].mutableCopy;
    }
    
    return _dataArr;
    
}
-(void)creatDownMenuView
{
    DOPDropDownMenu *menu = [[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(0, 0) andHeight:100];
    menu.backgroundColor=[UIColor blackColor];
    menu.delegate = self;
    menu.dataSource = self;
    [self.view addSubview:menu];
    
    
    
    
}
- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu
{
    
    return self.dataArr.count;
}
- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column
{
    NSMutableArray *arr=self.dataArr[column];
    
    return arr.count;
}
- (NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath
{
    return self.dataArr[indexPath.column][indexPath.row];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
