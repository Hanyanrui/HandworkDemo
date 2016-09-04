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
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    [self getData];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
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
[HandpicRequest getData:^(HandpickData *data)
    {
        SlideModel *model=data.slide[0];
    NSLog(@"%@",model);
}];


}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
//        return self.membersOpendArr.count;
        return 2;
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
//区头View
-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section==0)
    {
        return nil;
    }

    return nil;
}
//设置Cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
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
