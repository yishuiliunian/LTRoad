//
//  LTDiscoverViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTDiscoverViewController.h"
#import "LTDiscoverCell.h"
#import "LTUIDiscoverItem.h"
#import <DZProgramDefines.h>
#import <DZGeometryTools.h>
#import <DZImageCache.h>
#import "UIViewController+Additions.h"
#import "LTCoverFlowLayout.h"
#import "LTRecommondReadDataController.h"
#import "LTSelectedRoadViewController.h"
#import "LTCategoryListReq.h"
#import "LTGlobals.h"
INIT_DZ_EXTERN_STRING(kCoverCellIdentifier, kCoverCellIdentifier);
@interface LTDiscoverViewController () <MSRequestUIDelegate>
{
    NSArray* _discoverItems;
}
@property (nonatomic, assign) LTLayoutType layoutType;
@end
@implementation LTDiscoverViewController

- (instancetype) initWithLayoutType:(LTLayoutType)type
{
    UICollectionViewLayout* layout = [LTDiscoverViewController layoutWithType:type];
    self = [self initWithCollectionViewLayout:layout];
    if (!self) {
        return self;
    }
    return self;
}

+ (UICollectionViewLayout*) layoutWithType:(LTLayoutType)type
{
    switch (type) {
        case LTLayoutTypeGrid:
            return [LTDiscoverViewController gridLayout];
        case LTLayoutTypeCover:
            return [LTDiscoverViewController coverLayout];
        default:
            return nil;
            break;
    }
}
+ (UICollectionViewLayout*) gridLayout
{
    UICollectionViewFlowLayout* gridLayout = [UICollectionViewFlowLayout new];
    CGSize screenSize = CGCurrentScreenSize();
    
    CGFloat itemSpace = 30;
    CGSize itemSize = CGSizeZero;
    CGFloat itemRatio = 1.5;
    itemSize.width  = (screenSize.width - itemSpace*3) /2;
    itemSize.height = itemSize.width * itemRatio;
    gridLayout.itemSize = itemSize;
    gridLayout.minimumLineSpacing = itemSpace;
    gridLayout.minimumInteritemSpacing = itemSpace;
    return gridLayout;
    
}

+ (UICollectionViewFlowLayout*) coverLayout
{
    LTCoverFlowLayout* layout = [[LTCoverFlowLayout alloc] init];
    CGSize screenSize = CGCurrentScreenSize();
    CGFloat width = screenSize.width - 100;
    CGFloat height = 200;
    layout.itemSize = CGSizeMake(width, height);
    layout.scrollDirection =UICollectionViewScrollDirectionHorizontal;
    return (UICollectionViewFlowLayout*)layout;
}


- (void) reloadAllData
{

    LTCategoryListReq* listReq = [LTCategoryListReq new];
    listReq.city = LTShareSettings().currentCity;
    MSPerformRequestWithDelegateSelf(listReq);
}

#pragma mark Request delegate
//

- (void) request:(MSRequest *)request onError:(NSError *)error
{
    
}

- (void) request:(MSRequest *)request onSucced:(id)object
{
    _discoverItems = object;
    [self.collectionView reloadData];
}

//
#pragma mark -
- (void) setLayoutType:(LTLayoutType)layoutType
{
    if (_layoutType != layoutType) {
        _layoutType = layoutType;
        [self.collectionView setCollectionViewLayout:[LTDiscoverViewController layoutWithType:_layoutType] animated:YES completion:^(BOOL finished) {
            
        }];
        [self.collectionView reloadData];
    }
}
- (void) changeLayoutType
{
    LTLayoutType aimType = _layoutType == LTLayoutTypeGrid ? LTLayoutTypeCover : LTLayoutTypeGrid;
    [self setLayoutType:aimType];
}


- (void) viewDidLoad
{
    [super viewDidLoad];
    //
    UIBarButtonItem* left = [[UIBarButtonItem alloc] initWithImage:DZCachedImageByName(@"address") style:UIBarButtonItemStyleDone target:self action:@selector(changeLayoutType)];
    self.navigationItem.leftBarButtonItem = left;
    [self loadNavigationBarSearchItem];
    self.view.backgroundColor = [UIColor clearColor];
    self.collectionView.backgroundColor = [UIColor clearColor];
    [self.collectionView registerClass:[LTDiscoverCell class] forCellWithReuseIdentifier:kCoverCellIdentifier];
    [self reloadAllData];
}
- (void) search
{
    
}
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _discoverItems.count;
}

- (UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LTDiscoverCell* cell =(LTDiscoverCell*) [collectionView dequeueReusableCellWithReuseIdentifier:kCoverCellIdentifier forIndexPath:indexPath];
    LTUIDiscoverItem* item = _discoverItems[indexPath.row];
    cell.discoverItem = item;
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if(section==0)
    {
        return UIEdgeInsetsMake(35, 25, 15, 25);
    }
    else
    {
        return UIEdgeInsetsMake(15, 15, 15, 15);
    }
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LTUIDiscoverItem* item = _discoverItems[indexPath.row];
    LTRecommondReadDataController* dataController = [[LTRecommondReadDataController alloc] init];
    dataController.category = item.categoryID;
    LTSelectedRoadViewController* vc = [LTSelectedRoadViewController readViewControllerWithDataController:dataController];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
