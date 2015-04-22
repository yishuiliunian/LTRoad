//
//  LTMineViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTMineViewController.h"
#import "LTMineTopView.h"
#import "LTActionItem.h"
#import "LTActionCell.h"
#import "LTEditUserInfoViewController.h"
@interface LTMineViewController ()
{
    NSArray* _allActions;
    LTMineTopView* _topView;
}
@end
@implementation LTMineViewController

static NSString* const kCellIdentifier = @"kCellIdentifier";
- (void) viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    _topView = [LTMineTopView new];
    _topView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), _topView.minHeight);
    self.tableView.tableHeaderView = _topView;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[LTActionCell class] forCellReuseIdentifier:kCellIdentifier];
   
    UITapGestureRecognizer* tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGestrue:)];
    tapG.numberOfTapsRequired = 1;
    tapG.numberOfTouchesRequired =1;
    [_topView.avatarImageView addGestureRecognizer:tapG];
    [self reloadAllData];
}

- (void) handleTapGestrue:(UITapGestureRecognizer*)tap
{
    if (tap.state == UIGestureRecognizerStateRecognized) {
        LTEditUserInfoViewController* editUserInfoVC = [LTEditUserInfoViewController new];
        [self.navigationController pushViewController:editUserInfoVC animated:YES];
    }
}

- (void) reloadAllData
{
    LTActionItem* dynamicItem = [[LTActionItem alloc] init];
    dynamicItem.title = @"我的动态";
    
    LTActionItem* aboutItem = [[LTActionItem alloc] init];
    aboutItem.title = @"关于我们";
    
    _allActions = @[dynamicItem, aboutItem];
    
    [self.tableView reloadData];
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _allActions.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LTActionCell* cell = (LTActionCell*)[tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    LTActionItem* item = [_allActions objectAtIndex:indexPath.row];
    cell.textLabel.text = item.title;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
@end

