//
//  VideoViewController.m
//  HandworkDemo
//
//  Created by student on 16/9/7.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "VideoViewController.h"
static NSString *const Cell=@"cell";
@interface VideoViewController ()<DOPDropDownMenuDelegate,DOPDropDownMenuDataSource,UITableViewDataSource,UITableViewDelegate>
{
    NSInteger Cate ;
    NSInteger Price ;
    NSInteger Sort;
    
}
@property(nonatomic,strong)NSMutableArray *menuDataArr;
@property(nonatomic,strong)NSMutableArray *allSortTitleArr;
@property(nonatomic,strong)NSMutableArray *allVideoArr;
@property(nonatomic,strong)NSMutableArray *updateArr;
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatDownMenuView];
    [self createTableView];
    [self createRefreshHeaderAndFoofer];
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
-(NSMutableArray *)allVideoArr
{
    
    if (!_allVideoArr)
    {
       _allVideoArr=@[@"全部视频",@"免费",@"会员专享"].mutableCopy;
    }
    return _allVideoArr;
}
-(NSMutableArray*)updateArr
{
    if (!_updateArr)
    {
        _updateArr=@[@"最新跟新",@"人气",@"收藏最多",@"材料包有售"].mutableCopy;
    }
    return _updateArr;
}
-(NSMutableArray *)menuDataArr
{
    if (!_menuDataArr)
    {
        _menuDataArr=@[self.allSortTitleArr,self.allVideoArr,self.updateArr].mutableCopy;
    }
    
    return _menuDataArr;
}
-(NSMutableArray*)dataArr
{
    if (!_dataArr) {
        _dataArr=@[].mutableCopy;
    }
    return _dataArr;
}
#pragma mark- 创建menu，并实现代理方法
-(void)creatDownMenuView
{
    DOPDropDownMenu *menu = [[DOPDropDownMenu alloc] initWithOrigin:CGPointMake(0, 0) andHeight:40];
    menu.delegate = self;
    menu.dataSource = self;
    [self.view addSubview:menu];
    [self.view bringSubviewToFront:menu];
    [menu selectDefalutIndexPath];
    
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
    if (indexPath.column==0)
    {
        Cate=indexPath.row;
        
    }
    else if (indexPath.column==1)
    {
        Price=indexPath.row;
        
    }
    else
    {
        Sort=indexPath.row;
    }
    [self.tableView.mj_header beginRefreshing];
   
    
    
}
#pragma mark- 请求数据
-(void)getDataWithCate:(NSInteger)cate withPrice:(NSInteger)price withSort:(NSInteger)sort
{
  [self.dataArr removeAllObjects];
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [VideoRequest getDataWithCate:cate withPrice:price withSort:sort     withPage: @"1" withBlock:^(VideoData *data)
         {
             [weakSelf.dataArr addObjectsFromArray:data.data];
             [weakSelf.tableView.mj_header endRefreshing];
             
             dispatch_async(dispatch_get_main_queue(), ^{
                 
                 [weakSelf.tableView reloadData];
             });
             
         } withErrorBlock:^(NSError *error)
         {
             [SVProgressHUD showErrorWithStatus:@"失败了,再来一次！"];
             [weakSelf.tableView.mj_header endRefreshing];
         }];
    });
    
}
#pragma mark-下拉刷新和上提加载
-(void)createRefreshHeaderAndFoofer
{
    MJRefreshGifHeader *header=[MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData:)];
    [header setImages:RefreshImages forState:(MJRefreshStateRefreshing)];
    header.lastUpdatedTimeLabel.hidden = YES;
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"小客正在刷新" forState:MJRefreshStateRefreshing];
    self.tableView.mj_header=header;
    [header beginRefreshing];
    
    MJRefreshAutoGifFooter *footer=[MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData:)];
    [footer setImages:RefreshImages forState:(MJRefreshStateRefreshing)];
    [footer setTitle:@"上拉加载更多数据" forState:MJRefreshStateIdle];
    [footer setTitle:@"松开加载" forState:MJRefreshStatePulling];
    [footer setTitle:@"小客正在加载" forState:MJRefreshStateRefreshing];
    self.tableView.mj_footer=footer;
}
-(void)refreshData:(MJRefreshHeader*)header
{
    [self getDataWithCate:Cate withPrice:Price withSort:Sort];
}
-(void)loadMoreData:(MJRefreshAutoGifFooter*)footer
{
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSInteger  page=self.dataArr.count/20;
        NSString *pageStr=[NSString stringWithFormat:@"%ld",page+1];
        
        [VideoRequest getDataWithCate:Cate withPrice:Price withSort:Sort     withPage: pageStr withBlock:^(VideoData *data)
         {
             [weakSelf.dataArr addObjectsFromArray:data.data];
             [weakSelf.tableView.mj_footer endRefreshing];
             dispatch_async(dispatch_get_main_queue(), ^{
                 
                 [weakSelf.tableView reloadData];
             });
             
         } withErrorBlock:^(NSError *error)
         {
             [SVProgressHUD showErrorWithStatus:@"失败了,再来一次！"];
             [weakSelf.tableView.mj_footer endRefreshing];
         }];
    });

}













#pragma mark-初始化TableView
-(void)createTableView
{
    UITableView *tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 40, kMainW, kMainH-80) style:(UITableViewStylePlain)];
    tableView.delegate=self;
    tableView.dataSource=self;
    [self.view addSubview:tableView];
    [tableView registerClass:[VideoCell class] forCellReuseIdentifier:Cell];
    _tableView=tableView;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.dataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return kMainH/3+10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   VideoCell *cell=[tableView dequeueReusableCellWithIdentifier:Cell];
    VideoModel *model=self.dataArr[indexPath.row];
   cell.model=model;
    return cell;

}

@end
