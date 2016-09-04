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

static NSString * const reuseIdentifier = @"Cell";
static NSString * const reuseHeaderId = @"HeadView";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor=[UIColor whiteColor];
    [self getData];
//    [self.collectionView registerClass:[MembersOpenedCell class] forCellWithReuseIdentifier:reuseIdentifier];
//    [self.collectionView registerClass:[NavigationCell class] forCellWithReuseIdentifier:reuseIdentifier];
//    [self.collectionView registerClass:[AdvanceCell class] forCellWithReuseIdentifier:reuseIdentifier];
//    [self.collectionView registerClass:[HotspotCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerClass:[MemersOpenReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseHeaderId];
    
    // Do any additional setup after loading the view.
}
- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    return [self initWithCollectionViewLayout:layout];
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
-(void)getData
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [HandpicRequest getData:^(HandpickData *data)
         {
             [self.slideArr addObjectsFromArray:data.slide];
             [self.membersOpendArr  addObject: data.membersOpened];
             [self.navigationArr addObjectsFromArray:data.navigation];
             [self.advanceArr addObjectsFromArray:data.advance];
             [self.hotTopicArr addObjectsFromArray:data.hotTopic];
             dispatch_async(dispatch_get_main_queue(), ^{
                 [self.collectionView reloadData];
             });
         }];
    });
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
    return CGSizeMake(100, 300);
}
//区头大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(0, kMainH/4);
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
            NSLog(@"%ld",index);
        }];
        [reusableView addSubview:headView];
    }

   return reusableView;
}
//设置Cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.section==0)
//    {
//        MembersOpenedCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
//        MembersOpendModel *model=self.membersOpendArr[indexPath.row];
//        cell.model=model;
//        return cell;
//    }
//    else if (indexPath.section==1)
//    {
//        NavigationCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
//        NavigationModel *model=self.navigationArr[indexPath.row];
//        cell.model=model;
//         return cell;
//    }
//    else if (indexPath.section==2)
//    {
//        AdvanceCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
//        AdvanceModel *model=self.advanceArr[indexPath.row];
//        cell.model=model;
//         return cell;
//    }
//    else
//    {
//    HotspotCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
//        HotTopicModel *model=self.hotTopicArr[indexPath.row];
//        cell.model=model;
//         return cell;
//    }
    return nil;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
