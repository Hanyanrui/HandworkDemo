//
//  HandpickViewController.m
//  HandworkDemo
//
//  Created by student on 16/9/3.
//  Copyright © 2016年 HYR. All rights reserved.
//

#import "HandpickViewController.h"

@interface HandpickViewController ()
@property (nonatomic,strong)NSMutableArray *slideArr;
@property (nonatomic,strong)NSMutableArray *navigationArr;
@property (nonatomic,strong)NSMutableArray *advanceArr;
@property (nonatomic,strong)NSMutableArray *hotTopicArr;
@property (nonatomic,strong)NSMutableArray *membersOpendArr;
@end

@implementation HandpickViewController


static NSString * const reuseHeaderId = @"HeadView";
static NSString * const MembersOpened = @"MembersOpened";
static NSString * const Navigation = @"Navigation";
static NSString * const Advance = @"Advance";
static NSString * const Hotspot= @"Hotspot";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor=[UIColor whiteColor];
    [self ceratRefreshHeader];
    [self registCustomCell];

    
}
- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    return [self initWithCollectionViewLayout:layout];
}
//注册可以复用的cell
-(void)registCustomCell
{
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([MembersOpenedCell class]) bundle:nil]forCellWithReuseIdentifier:MembersOpened];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([NavigationCell class]) bundle:nil] forCellWithReuseIdentifier:Navigation];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([AdvanceCell class]) bundle:nil] forCellWithReuseIdentifier:Advance];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([HotspotCell class]) bundle:nil] forCellWithReuseIdentifier:Hotspot];
    [self.collectionView registerClass:[MemersOpenReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseHeaderId];
}
-(void)ceratRefreshHeader
{
    MJRefreshGifHeader *header=[MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData:)];
    [header setImages:RefreshImages forState:(MJRefreshStateRefreshing)];
    header.lastUpdatedTimeLabel.hidden = YES;
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"小客正在刷新" forState:MJRefreshStateRefreshing];
    self.collectionView.mj_header=header;
    [header beginRefreshing];
}
#pragma mark - 懒加载数据源
-(NSMutableArray*)slideArr
{
    if (!_slideArr)
    {
        _slideArr=@[].mutableCopy;
    }
    return _slideArr;
}
-(NSMutableArray*)membersOpendArr
{
    if (!_membersOpendArr)
    {
        _membersOpendArr=@[].mutableCopy;
    }
    return _membersOpendArr;
}
-(NSMutableArray*)navigationArr
{
    if (!_navigationArr)
    {
        _navigationArr=@[].mutableCopy;
    }
    return _navigationArr;
}
-(NSMutableArray*)advanceArr
{
    if (!_advanceArr)
    {
        _advanceArr=@[].mutableCopy;
    }
    return _advanceArr;
}
-(NSMutableArray*)hotTopicArr
{
    if (!_hotTopicArr)
    {
        _hotTopicArr=@[].mutableCopy;
    }
    return _hotTopicArr;

}
//请求数据

-(void)getData
{
    [self.slideArr removeAllObjects];
    [self.membersOpendArr removeAllObjects];
    [self.navigationArr removeAllObjects];
    [self.advanceArr removeAllObjects];
    [self.hotTopicArr removeAllObjects];
     __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [HandpicRequest getData:^(HandpickData *data) {
            [weakSelf.slideArr addObjectsFromArray:data.slide];
            [weakSelf.membersOpendArr  addObject: data.membersOpened];
            [weakSelf.navigationArr addObjectsFromArray:data.navigation];
            [weakSelf.navigationArr addObject:[self setQianDaoModel]];
            [weakSelf.advanceArr addObjectsFromArray:data.advance];
            [weakSelf.hotTopicArr addObjectsFromArray:data.hotTopic];
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.collectionView.mj_header endRefreshing];
                [weakSelf.collectionView reloadData];
            });

        } withErrorBlock:^(NSError *error) {
            [SVProgressHUD showErrorWithStatus:@"失败了,再来一次"];
            [weakSelf.collectionView.mj_header endRefreshing];
        }];
    });
}
//刷新数据
-(void)refreshData:(MJRefreshGifHeader *)header
{
    [self getData];
}
//签到模块
-(NavigationModel*)setQianDaoModel
{
    NavigationModel *model=[NavigationModel new];
    model.name=@"签到";
    model.pic=nil;
    return model;
}
#pragma mark <UICollectionViewDataSource>
//区的数量
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 4;
}
//每个区的模块数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section==0)
    {
        return self.membersOpendArr.count;
    }
    else if (section==1)
    {
        return self.navigationArr.count;
    }
    else if (section==2)
    {
        return self.advanceArr.count;
    }
    else
    {
        return self.hotTopicArr.count;
    }
}
//模块大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        MembersOpendModel*model=self.membersOpendArr[indexPath.row];
        CGFloat height=kMainW/[model.width floatValue] *[model.height floatValue];
        return CGSizeMake(kMainW, height);
    }
    else if(indexPath.section==1)
    {
        CGFloat width =kMainW/8;
        CGFloat height=width*3/2;
        return CGSizeMake(width, height);
    }
    else if (indexPath.section==2)
    {
       return CGSizeMake((kMainW-5)/2, kMainH/4);
    }
    else
    {
    return CGSizeMake(kMainW, kMainH/3);
    }
}
//列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;
{
    if (section==1)
    {
        return kMainW/15;
    }
    else if (section==2)
    {
        return 5;
    }
    return 0.0f;
}
//行间距
 - (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0f;
}
//页边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section==1)
    {
         CGFloat width =kMainW/8;
         return UIEdgeInsetsMake(0,width/2,10, width/2);
    }
    else
    {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
}
//区头大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section==0)
    {
        return CGSizeMake(0, kMainH/4);
    }
    else if (section==3)
    {
        return CGSizeMake(0, kMainH/20);
    }
    else
    {
        return CGSizeZero;
    }
}
//区头View
-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
   UICollectionReusableView *reusableView=reusableView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseHeaderId forIndexPath:indexPath];
    for (UIView *view in reusableView.subviews) {
        [view removeFromSuperview];
    }
    if (indexPath.section==0)
    {
        SectionOneHeadView *headView=[[SectionOneHeadView alloc]initWithFrame:
                                      CGRectMake(0, 0, kMainW, kMainH/4) withImageUrlArr:self.slideArr];
        [headView clickImageOfCycleScrollViewWithBlock:^(NSInteger index) {
            NSLog(@"%ld",(long)index);
        }];
        [reusableView addSubview:headView];
    }
    else if (indexPath.section==3)
    {
        UILabel *hotTopicLB=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, kMainW, kMainH/20)];
        hotTopicLB.text=@"————————————热门专题————————————";
        hotTopicLB.adjustsFontSizeToFitWidth=YES;
        hotTopicLB.textAlignment=NSTextAlignmentCenter;
        hotTopicLB.textColor=[UIColor grayColor];
         [reusableView addSubview:hotTopicLB];
    }
   return reusableView;
}
//设置Cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0)
    {
        MembersOpenedCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MembersOpened forIndexPath:indexPath];
        MembersOpendModel *model=self.membersOpendArr[indexPath.row];
        cell.model=model;
        return cell;
    }
    else if (indexPath.section==1)
    {
        NavigationCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Navigation forIndexPath:indexPath];
        NavigationModel *model=self.navigationArr[indexPath.row];
        cell.model=model;
         return cell;
    }
    else if (indexPath.section==2)
    {
        AdvanceCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Advance forIndexPath:indexPath];
        AdvanceModel *model=self.advanceArr[indexPath.row];
        cell.model=model;
         return cell;
    }
    else
    {
    HotspotCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Hotspot forIndexPath:indexPath];
        HotTopicModel *model=self.hotTopicArr[indexPath.row];
        cell.model=model;
         return cell;
    }
}

#pragma mark <UICollectionViewDelegate>
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        NSLog(@"开通会员，十三大专属特权");
    }
    else if(indexPath.section==1)
    {
        if (indexPath.row==0)
        {
            NSLog(@"看电视");
        }
        else if(indexPath.row==1)
        {
        NSLog(@"玩直播");
        }
        else if(indexPath.row==2)
        {
          NSLog(@"线下可");
        }
        else
        {
        NSLog(@"签到");
        }
    }
    else if(indexPath.section==2)
    {
        if (indexPath.row==0)
        {
            NSLog(@"新手入门");
        }
        else
        {
            NSLog(@"每日热点教程");
        }
    }
    else
    {
        NSLog(@"热门专题---%ld",(long)indexPath.row);
    }
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath

{  CATransform3D rotation;//3D旋转
//       rotation = CATransform3DMakeTranslation(0 ,50 ,20);
    rotation = CATransform3DMakeRotation( M_PI_4 , 0.0, 0.7, 0.4);
    //逆时针旋转
    rotation = CATransform3DScale(rotation, 0.8, 0.8, 1);
    
    rotation.m34 = 1.0/ 1000;
    cell.layer.shadowColor = [[UIColor redColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    cell.layer.transform = rotation;
    
    [UIView beginAnimations:@"rotation" context:NULL];
    //旋转时间
    [UIView setAnimationDuration:0.6];
    
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    [UIView commitAnimations];
}






@end
