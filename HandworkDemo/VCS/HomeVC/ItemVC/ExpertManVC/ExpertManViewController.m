//
//  ExpertManViewController.m
//  HandworkDemo
//
//  Created by student on 16/9/5.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "ExpertManViewController.h"
static NSString * const reuseId = @"reuseIdentifier";
@interface ExpertManViewController ()
@property(nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation ExpertManViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createRefreshHeaderAndFoofer];
    [self registCustomCell];
}
//懒加载数据源
-(NSMutableArray *)dataArr
{
    if (!_dataArr)
    {
        _dataArr=@[].mutableCopy;
    }
    return _dataArr;
}
-(void)registCustomCell
{
    [self.tableView registerClass:[ExpertManCell class] forCellReuseIdentifier:reuseId];
}
-(void)createRefreshHeaderAndFoofer
{
    MJRefreshGifHeader *header=[MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    [header setImages:RefreshImages forState:(MJRefreshStateRefreshing)];
     header.lastUpdatedTimeLabel.hidden = YES;
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"小客正在刷新" forState:MJRefreshStateRefreshing];
    self.tableView.mj_header=header;
    [header beginRefreshing];
    
    MJRefreshAutoGifFooter *footer=[MJRefreshAutoGifFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    [footer setImages:RefreshImages forState:(MJRefreshStateRefreshing)];
    [footer setTitle:@"上拉加载更多数据" forState:MJRefreshStateIdle];
    [footer setTitle:@"松开加载" forState:MJRefreshStatePulling];
    [footer setTitle:@"小客正在加载" forState:MJRefreshStateRefreshing];
    self.tableView.mj_footer=footer;
}
//请求数据和下拉刷新
-(void)getData
{
    [self.dataArr removeAllObjects];
     __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:@"up",@"act",@"20",@"vid", nil];
      [ExpertManRequest getDataWithDic:dic withBlock:^(ExpertManData *data) {
          [weakSelf.dataArr addObjectsFromArray:data.data];
          [weakSelf.tableView.mj_header endRefreshing];
          [weakSelf.tableView reloadData];
      } withErrorBlock:^(NSError *error) {
          [SVProgressHUD showErrorWithStatus:@"失败了,再来一次！"];
          [weakSelf.tableView.mj_header endRefreshing];
      }];

    });
}
-(void)refreshData
{
    [self getData];
}
//上提加载跟多数据
-(void)loadMoreData
{
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        DataModel *model= [self.dataArr lastObject];
        NSString *last_id=model.course_time;
        NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:@"down",@"act",@"20",@"vid",last_id,@"last_id", nil];
        [ExpertManRequest getDataWithDic:dic withBlock:^(ExpertManData *data) {
            [weakSelf.dataArr addObjectsFromArray:data.data];
            [weakSelf.tableView.mj_footer endRefreshing];
            [weakSelf.tableView reloadData];
        } withErrorBlock:^(NSError *error) {
            [SVProgressHUD showErrorWithStatus:@"失败了,再来一次！"];
            [weakSelf.tableView.mj_footer endRefreshing];
        }];
    });
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
     DataModel*model=self.dataArr[indexPath.row%(self.dataArr.count)];
    
    return [self.tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[ExpertManCell class] contentViewWidth:[UIScreen mainScreen].bounds.size.width];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     __weak typeof(self) weakSelf = self;
    ExpertManCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId forIndexPath:indexPath];
    DataModel *model=self.dataArr[indexPath.row];
    cell.attentionBtn.tag=[model.user_id integerValue];

    cell.model=model;
    [cell attentionBtnClick:^(NSInteger index) {
      
        NSString *info=[[NSUserDefaults standardUserDefaults]objectForKey:@"info"];
        if (info)
        {
            [weakSelf addGauZhuRequest:model withIndex:indexPath];
        }
        else
        {
          [weakSelf.navigationController pushViewController:[LoginViewController new] animated:YES];
        }
        
    
        
    }];
    return cell;
}
-(void)addGauZhuRequest:(DataModel*)model withIndex:(NSIndexPath*)indexPath
{
    IndicaterStart
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:model.user_id,@"uid",@"20",@"vid", nil];
   __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [AddGuanZhuRequest getDataWithDic:dic withBlock:^(AddGuanZhuData *data) {
            dispatch_async(dispatch_get_main_queue(), ^{
                DataModel *model= self.dataArr[indexPath.row];
                if ([model.guan_status isEqualToString:@"0"])
                {
                    model.guan_status=@"1";
                }
                else
                {
                 model.guan_status=@"0";
                }
                IndicaterEnd
                [weakSelf.tableView reloadData];
            });
            
        } withErrorBlock:^(NSError *error) {
            NSLog(@"失败");
        }];
    });
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
