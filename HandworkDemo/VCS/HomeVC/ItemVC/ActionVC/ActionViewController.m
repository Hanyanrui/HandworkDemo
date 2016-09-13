//
//  ActionViewController.m
//  HandworkDemo
//
//  Created by student on 16/9/5.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "ActionViewController.h"
static NSString * const reuseId = @"reuseIdentifier";
@interface ActionViewController ()
@property(nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation ActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registCustomCell];
    [self createRefreshHeaderAndFoofer];
}
//懒加载数据源
-(NSMutableArray*)dataArr
{
    if (!_dataArr)
    {
        _dataArr=@[].mutableCopy;
    }
    return _dataArr;
}
-(void)registCustomCell
{
    [self.tableView registerClass:[ActionCell class] forCellReuseIdentifier:reuseId];

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

-(void)getData
{
    [self.dataArr removeAllObjects];
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [ActionRequest getDataWithID:@"0" withBlock:^(ActionData *data) {
            [weakSelf.dataArr addObjectsFromArray:data.data];
             [weakSelf.tableView.mj_header endRefreshing];
            
            dispatch_async(dispatch_get_main_queue(), ^{

                [weakSelf.tableView reloadData];
            });
            
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
-(void)loadMoreData
{
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        ActionModel *model= [self.dataArr lastObject];
        [ActionRequest getDataWithID:model.actionId withBlock:^(ActionData *data) {
            [weakSelf.dataArr addObjectsFromArray:data.data];
            [weakSelf.tableView.mj_footer endRefreshing];
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [weakSelf.tableView reloadData];
            });
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
   
    return kMainW/3+kMainW/8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ActionCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId forIndexPath:indexPath];
    cell.model=self.dataArr[indexPath.row];
    
    return cell;
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
