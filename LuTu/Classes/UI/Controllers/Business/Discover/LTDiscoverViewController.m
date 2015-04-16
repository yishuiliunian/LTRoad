//
//  LTDiscoverViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTDiscoverViewController.h"
#import "CCoverflowCollectionViewLayout.h"
#import "LTDiscoverCell.h"
#import "LTUIDiscoverItem.h"
#import <DZProgramDefines.h>
#import <DZGeometryTools.h>
#import <DZImageCache.h>
#import "UIViewController+Additions.h"
INIT_DZ_EXTERN_STRING(kCoverCellIdentifier, kCoverCellIdentifier);
@interface LTDiscoverViewController ()
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
    CCoverflowCollectionViewLayout* layout = [[CCoverflowCollectionViewLayout alloc] init];
    return (UICollectionViewFlowLayout*)layout;
}

+ (UICollectionView*) collectionViewWithType:(LTLayoutType)type
{
    UICollectionViewLayout* layout = [self layoutWithType:type];
    UICollectionView* collectionView = [[UICollectionView alloc] initWithFrame:CGRectLoadViewFrame collectionViewLayout:layout];
    return collectionView;
}
- (void) reloadAllData
{
    NSMutableArray* array = [NSMutableArray new];
    for (int i = 0  ; i < 10; i++) {
        LTUIDiscoverItem* item = [LTUIDiscoverItem new];
        item.title = @"xxx";
        item.backgroundURL = [NSURL URLWithString:@"http://preview.quanjing.com/danita_rm008/us02-rbe0002.jpg"];
        [array addObject:item];
    }
    
    _discoverItems = array;
    [self.collectionView reloadData];
}
- (void) setLayoutType:(LTLayoutType)layoutType
{
    if (_layoutType != layoutType) {
        _layoutType = layoutType;
        UICollectionView* currentCollectionView = self.collectionView;
        UICollectionView* aimCollectionView = [LTDiscoverViewController collectionViewWithType:layoutType];
        aimCollectionView.frame = currentCollectionView.frame;
        self.collectionView = aimCollectionView;
        [currentCollectionView.superview addSubview:aimCollectionView];
        [currentCollectionView removeFromSuperview];
         [self.collectionView registerClass:[LTDiscoverCell class] forCellWithReuseIdentifier:kCoverCellIdentifier];
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

//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    if(section==0)
//    {
//        return UIEdgeInsetsMake(35, 25, 15, 25);
//    }
//    else
//    {
//        return UIEdgeInsetsMake(15, 15, 15, 15);
//    }
//}

@end
