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
        self.collectionView.collectionViewLayout= [LTDiscoverViewController layoutWithType:_layoutType];
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
    self.view.backgroundColor = [UIColor clearColor];
    [self.collectionView registerClass:[LTDiscoverCell class] forCellWithReuseIdentifier:kCoverCellIdentifier];
    [self reloadAllData];
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

@end
