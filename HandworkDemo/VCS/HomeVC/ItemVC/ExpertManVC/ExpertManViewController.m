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
    [self getData];
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
//请求数据
-(void)getData
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [ExpertManRequest getData:^(ExpertManData *data) {
            [self.dataArr addObjectsFromArray:data.data];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }];
    });

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
//      return [self cellHeightForIndexPath:indexPath cellContentViewWidth:[UIScreen mainScreen].bounds.size.width];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ExpertManCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId forIndexPath:indexPath];
    DataModel *model=self.dataArr[indexPath.row];

    cell.model=model;
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
