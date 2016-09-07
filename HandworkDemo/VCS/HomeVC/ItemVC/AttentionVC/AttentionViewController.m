//
//  AttentionViewController.m
//  HandworkDemo
//
//  Created by student on 16/9/6.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "AttentionViewController.h"
static NSString * const reuseId = @"reuseIdentifier";
@interface AttentionViewController ()
@property(nonatomic,strong)NSMutableArray *dataArr;
@end

@implementation AttentionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createRefreshHeaderAndFoofer];
    [self registCell];
    self.tableView.backgroundColor=[UIColor lightGrayColor];
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
}
-(NSMutableArray*)dataArr
{
    if (!_dataArr)
    {
        _dataArr=@[].mutableCopy;
    }
    return _dataArr;

}
-(void)registCell
{
    [self.tableView registerClass:[AttentionCell class] forCellReuseIdentifier:reuseId];

}
-(void)getData
{
    [self.dataArr removeAllObjects];
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:@"4j4mkevnbdiosio53jb7bculn5",@"PHPSESSID",@"YjoxOw%3D%3D",@"sgkv3_in_sys",@"aToxNzQwMDA2OTs%3D",@"sgkvs_uid",@"czoxOToic2drX21fMTQ3MzE0NDU3ODI1MyI7",@"sgkv3_uname",@"czozNjoiNUFENzU5RDgtNzRCNS00RkNELUE5MkItRDQ1QUMxRTIzNDNDIjs%3D",@"sgkv_sgk_token", nil];
        [AttentionRequest getDataWithDic:dic withBlock:^(AttentionData *data) {
            [weakSelf.dataArr addObjectsFromArray:data.data];
            [weakSelf.tableView.mj_header endRefreshing];
            [weakSelf.tableView reloadData];
        } withErrorBlock:^(NSError *error) {
            [SVProgressHUD showErrorWithStatus:@"失败了,再来一次！"];
            [weakSelf.tableView.mj_header endRefreshing];
        }];
    });

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
-(void)refreshData
{
    [self getData];
}
-(void)loadMoreData
{
    AttentionModel *model=[self.dataArr lastObject];
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:@"4j4mkevnbdiosio53jb7bculn5",@"PHPSESSID",@"YjoxOw%3D%3D",@"sgkv3_in_sys",@"aToxNzQwMDA2OTs%3D",@"sgkvs_uid",@"czoxOToic2drX21fMTQ3MzE0NDU3ODI1MyI7",@"sgkv3_uname",@"czozNjoiNUFENzU5RDgtNzRCNS00RkNELUE5MkItRDQ1QUMxRTIzNDNDIjs%3D",@"sgkv_sgk_token",model.pmid,@"id", nil];
        [AttentionRequest getDataWithDic:dic withBlock:^(AttentionData *data) {
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
    AttentionModel *model=self.dataArr[indexPath.row];
    
    if ([model.type isEqualToString:@"follow"])
    {
        return kMainW/5+65;
    }
    else
    {
    
        return kMainW*3/10+65;
    
    }
    
    
    
    
    
    
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AttentionCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId forIndexPath:indexPath];
    cell.model=self.dataArr[indexPath.row];
    
    __weak typeof(self) weakSelf = self;
    [cell guanzhuBtnClickWithBlock:^(NSInteger index) {
    
        
        NSString *info=[[NSUserDefaults standardUserDefaults]objectForKey:@"info"];
        if (info)
        {
            [weakSelf addGauZhuRequest:cell.model withIndex:indexPath];
        }
        else
        {
            [weakSelf.navigationController pushViewController:[LoginViewController new] animated:YES];
        }
    }];
    
    [cell changePageWithBlock:^(NSInteger index) {
        NSLog(@"跳转页面");
    }];
    
    return cell;
}
-(void)addGauZhuRequest:(AttentionModel*)model withIndex:(NSIndexPath*)indexPath
{
   IndicaterStart
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:model.user_id,@"uid",@"20",@"vid", nil];
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [AddGuanZhuRequest getDataWithDic:dic withBlock:^(AddGuanZhuData *data) {
            
            dispatch_async(dispatch_get_main_queue(), ^{
                AttentionModel *model01=self.dataArr[indexPath.row];
                FollowModel *model02=[model01.follow firstObject];
                if ([model02.follow_status isEqualToString:@"0"])
                {
                    model02.follow_status=@"1";
                }
                else
                {
                    model02.follow_status=@"0";
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
