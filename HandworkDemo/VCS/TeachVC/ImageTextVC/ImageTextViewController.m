//
//  ImageTextViewController.m
//  HandworkDemo
//
//  Created by student on 16/9/7.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "ImageTextViewController.h"
static NSString *const Cell=@"cell";
@interface ImageTextViewController ()<DOPDropDownMenuDelegate,DOPDropDownMenuDataSource,UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)NSMutableArray *menuDataArr;
@property(nonatomic,strong)NSMutableArray *allSortTitleArr;
@property(nonatomic,strong)NSMutableArray *allSortImageArr;
@property(nonatomic,strong)NSMutableArray *timeTitleArr;
@property(nonatomic,strong)NSMutableArray *timeImageArr;
@property(nonatomic,strong)NSMutableArray *standardTitleArr;
@property(nonatomic,strong)NSMutableArray *standardImageArr;
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)UICollectionView *collectionView;
@end

@implementation ImageTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
    self.view.backgroundColor=[UIColor redColor];
     [self creatDownMenuView];
    [self creatCollectionView];
   

    
}



#pragma mark-懒加载初始化数据源
-(NSMutableArray*)allSortTitleArr
{
    if (!_allSortTitleArr)
    {
        _allSortTitleArr=@[@"全部分类",@"皮艺",@"编织",@"木艺",@"模型",@"橡皮章",@"园艺多肉",@"手工护肤",@"旧物改造",@"电子科技",@"金属工艺",@"布艺",@"纸艺",@"饰品",@"刺绣",@"羊毛毡",@"黏土陶艺",@"手工印染",@"美食烘焙",@"滴胶热缩",@"雕塑雕刻",@"其他"].mutableCopy;
    }
    return _allSortTitleArr;
}
-(NSMutableArray *)timeTitleArr
{
    
    if (!_timeTitleArr)
    {
        _timeTitleArr=@[@"一周",@"一月",@"全部教程"].mutableCopy;
    }
    return _timeTitleArr;
}
-(NSMutableArray*)standardTitleArr
{
    if (!_standardTitleArr)
    {
        _standardTitleArr=@[@"最热教程",@"最新跟新",@"评论最多",@"收藏最多",@"材料包有售",@"成品有售"].mutableCopy;
    }
    return _standardTitleArr;
}
-(NSMutableArray *)menuDataArr
{
    if (!_menuDataArr)
    {
        _menuDataArr=@[self.allSortTitleArr,self.timeTitleArr,self.standardTitleArr].mutableCopy;
    }
    
    return _menuDataArr;
    
}
-(NSMutableArray*)dataArr
{
    if (!_dataArr)
    {
        _dataArr=@[].mutableCopy;
    }
    return _dataArr;
}
#pragma mark- 创建menu，并实现代理方法
-(void)creatDownMenuView
{
    DOPDropDownMenu *menu = [[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(0, 0) andHeight:40];
    menu.backgroundColor=[UIColor blackColor];
    menu.delegate = self;
    menu.dataSource = self;
    [self.view addSubview:menu];
    [self.view bringSubviewToFront:menu];
    [menu selectDefalutIndexPath];
   
}
-(void)creatCollectionView
{
    UICollectionViewFlowLayout *layOut=[[UICollectionViewFlowLayout alloc]init];
    [layOut setScrollDirection:UICollectionViewScrollDirectionVertical];
    self.collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 40, kMainW, kMainH-40) collectionViewLayout:layOut];
   self.collectionView.backgroundColor=[UIColor lightGrayColor];
   self.collectionView.delegate=self;
   self.collectionView.dataSource=self;
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([ImageTextCell class]) bundle:nil] forCellWithReuseIdentifier:Cell];
    [self.view addSubview:self.collectionView];


}
- (NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu
{
   
    return self.menuDataArr.count;
   
}
- (NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column
{
    NSMutableArray *arr=self.menuDataArr[column];
    
    return arr.count;
}
- (NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath
{
    return self.menuDataArr[indexPath.column][indexPath.row];
    
}
-(void)menu:(DOPDropDownMenu *)menu didSelectRowAtIndexPath:(DOPIndexPath *)indexPath
{
   static NSInteger sort,time,order;
    if (indexPath.column==0)
    {
        sort=indexPath.row;
        
    }
    else if (indexPath.column==1)
    {
        time=indexPath.row;
       
    }
    else
    {
        order=indexPath.row;
    }
    [self getDataWithSort:sort withTime:time withOrder:order];
    
}
#pragma mark-请求数据
-(void)getDataWithSort:(NSInteger)sort withTime:(NSInteger)time withOrder:(NSInteger)order
{
    [self.dataArr removeAllObjects];
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    
        [ImageTextRequest getDataWithSort:sort withTime:time withStander:order withBlock:^(ImageTextData *data)
         {
             [weakSelf.dataArr addObjectsFromArray:data.data];
             
             dispatch_async(dispatch_get_main_queue(), ^{
                 
                 [weakSelf.collectionView reloadData];
             });
             
         } withErrorBlock:^(NSError *error)
         {
             [SVProgressHUD showErrorWithStatus:@"失败了,再来一次！"];
//             [weakSelf.tableView.mj_footer endRefreshing];
         }];
    });

}
#pragma mark collection的代理方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return self.dataArr.count;

}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    return CGSizeMake((kMainW-30)/2,kMainH*1/2);
    
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}


-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageTextCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:Cell forIndexPath:indexPath];
    cell.backgroundColor=[UIColor yellowColor];
    ImageTextModel *model=self.dataArr[indexPath.row];
    cell.model=model;
    return cell;


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
