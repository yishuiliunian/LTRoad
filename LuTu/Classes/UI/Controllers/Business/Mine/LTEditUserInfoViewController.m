//
//  LTEditUserInfoViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTEditUserInfoViewController.h"
#import <DZProgramDefines.h>
#import <DZGeometryTools.h>
#import "LKHaneke.h"
#import "LTUserInfoItem.h"
#import "LTGlobals.h"
@interface LTEditUserInfoTopView : UIView
DEFINE_PROPERTY_STRONG_UIImageView(avatarImageView);
DEFINE_PROPERTY_STRONG_UIImageView(cameraIndicatorImageView);
@end

@implementation LTEditUserInfoTopView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SELF_SUBVIEW_UIImageView(_avatarImageView);
    INIT_SELF_SUBVIEW_UIImageView(_cameraIndicatorImageView);
    _avatarImageView.layer.masksToBounds = YES;
    _avatarImageView.hnk_cacheFormat = LTHanekeCacheFormatAvatar();
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    CGFloat offset = 15;
    CGFloat height = CGRectGetHeight(self.bounds) - offset * 2;
    _avatarImageView.frame = CGRectMake(CGRectWidthOffsetCenter(self.bounds, height), offset, height, height);
    _avatarImageView.layer.cornerRadius = height/2;
    CGRect indicatorRect = CGRectZero;
    indicatorRect.origin = _avatarImageView.center;
    indicatorRect.size = CGSizeMake(height/3, height/3);
}

@end

@interface LTEditUserInfoViewController ()
{
    LTEditUserInfoTopView* _topView;
    NSArray* _allInfoItems;
    
    LTUserInfoItem* _nickItem;
    LTUserInfoItem* _carInfoItem;
    LTUserInfoItem* _ageInfoItem;
}
@end

@implementation LTEditUserInfoViewController

static NSString* const kCellIdentifier = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    _topView = [[LTEditUserInfoTopView alloc] initWithFrame:CGRectMake(0, 0, 0, 100)];
    self.tableView.tableHeaderView = _topView;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.backgroundColor = LTColorBackgroundGray();
    self.tableView.tableFooterView = [UIView new];
    [self reloadData];
}
- (void) reloadData
{
#define LTCreateInfoItem(n, d) [[LTUserInfoItem alloc] initWithName:@""#n detail:@""#d];
    _nickItem = LTCreateInfoItem(昵称, 未知);
    _carInfoItem = LTCreateInfoItem(车型, 未知);
    _ageInfoItem = LTCreateInfoItem(驾龄, 未知);
    
    NSArray* nickSetction = @[_nickItem];
    NSArray* infoSection = @[_carInfoItem, _ageInfoItem];
    
    _allInfoItems = @[nickSetction ,infoSection];
    
    [self.tableView reloadData];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return _allInfoItems.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_allInfoItems[section] count];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kCellIdentifier];
        cell.contentView.backgroundColor = [UIColor whiteColor];
    }
    LTUserInfoItem* item = _allInfoItems[indexPath.section][indexPath.row];
    cell.textLabel.text = item.name;
    cell.detailTextLabel.text = item.detail;
    return cell;
}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    } else if (section ==1 ) {
        return 30;
    }
    return 0;
}
@end
