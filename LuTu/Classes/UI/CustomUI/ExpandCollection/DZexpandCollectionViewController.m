//
//  DZexpandCollectionViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/13.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "DZexpandCollectionViewController.h"
#import <DZProgramDefines.h>
#import "LTCarMeetCell.h"
#import "LTUICarMeet.h"
#import "LTCarMeetDetailViewController.h"
@interface DZexpandCollectionViewController () <LTCarMeetCellDelegate>

@end
INIT_DZ_EXTERN_STRING(kCellIdentifier, expandCell);
@implementation DZexpandCollectionViewController
- (void) loadView
{
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(100, 150);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _expandCollectionView = [[DZExpandCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    _expandCollectionView.delegate = self;
    _expandCollectionView.dataSource = self;
    self.view = _expandCollectionView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.expandCollectionView registerClass:[LTCarMeetCell class] forCellWithReuseIdentifier:kCellIdentifier];
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _items.count;
}

- (UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LTCarMeetCell* cell = (LTCarMeetCell*)[collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
    LTUICarMeet* carmeet = _items[indexPath.row];
    cell.delegate = self;
    cell.carMeet = carmeet;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setItems:(NSArray *)items
{
    if (_items != items) {
        _items = items;
        [self.expandCollectionView reloadData];
    }
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LTUICarMeet* carmeet = _items[indexPath.row];
    if ([self.delegate respondsToSelector:@selector(expandViewController:didSelectItem:)]) {
        [self.delegate expandViewController:self didSelectItem:carmeet];
    }
}
- (void) carMeetCell:(LTCarMeetCell *)cell didTapOnMenuItem:(id)sender
{
    LTCarMeetDetailViewController* detailVC = [LTCarMeetDetailViewController new];
    [self.navigationController pushViewController:detailVC animated:YES];
    [self.expandCollectionView closeExpand:cell];
}
@end
