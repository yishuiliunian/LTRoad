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
#import "LTMyCarClubViewController.h"
#import "LTAccountManager.h"
#import "LTMyFavoriteViewController.h"
#import "LKHaneke.h"
#import "LTGlobals.h"
#import "LTUserStatsListReq.h"
#import "LTMyThreadDataController.h"
#import "LTCarMeetFeedViewController.h"
#import "LTSettingsViewController.h"
#import "LTMyNewsDataController.h"
#import "LTMyNewsViewController.h"
#import "LTMyMessagesDataController.h"
@interface LTMineViewController () <MSRequestUIDelegate>
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
    
    //
    [_topView.carFriendButton addTarget:self action:@selector(handleShowMyClub) forControlEvents:UIControlEventTouchUpInside];
    [_topView.favarateButton addTarget:self action:@selector(handleShowMyFavorate) forControlEvents:UIControlEventTouchUpInside];
    [_topView.feedButton addTarget:self action:@selector(handleShowMyThreads) forControlEvents:UIControlEventTouchUpInside];
    [_topView.settingButton addTarget:self action:@selector(handleShowSettings) forControlEvents:UIControlEventTouchUpInside];
    [_topView.messageButton addTarget:self action:@selector(handleShowMessages) forControlEvents:UIControlEventTouchUpInside];
    //
    self.naviationBarStyle = LTNavigationStyleTransparency;
}
- (void) handleShowMessages
{
    LTMyMessagesDataController* messageDataController = [LTMyMessagesDataController new];
    LTMyNewsViewController* vc = [[LTMyNewsViewController alloc] initWithDataController:messageDataController];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void) handleShowSettings
{
    LTSettingsViewController* settingsVC = [[LTSettingsViewController alloc] init];
    [self.navigationController pushViewController:settingsVC animated:YES];
}
- (void) handleTapGestrue:(UITapGestureRecognizer*)tap
{
    if (tap.state == UIGestureRecognizerStateRecognized) {
        if (![LTShareAccountManager checkApplicationAuthorization]) {
            [LTShareAccountManager ensureApplicationAuthorization:^{
                [self reloadAllData];
            }];
        } else {
            LTEditUserInfoViewController* editUserInfoVC = [LTEditUserInfoViewController new];
            [self.navigationController pushViewController:editUserInfoVC animated:YES];
        }
    }
}

- (void) handleShowMyFavorate
{
    LTMyFavoriteViewController* fvc = [LTMyFavoriteViewController myFavoriteViewController];
    [self.navigationController pushViewController:fvc animated:YES];
}
- (void) handleShowMyClub
{
    LTMyCarClubViewController* clubVC = [[LTMyCarClubViewController alloc]initWithUID:LTCurrentAccount.accountID];
    [self.navigationController pushViewController:clubVC animated:YES];
}

- (void) handleShowMyThreads
{
    LTMyThreadDataController* dataController = [LTMyThreadDataController new];
    LTCarMeetFeedViewController* feedVC = [[LTCarMeetFeedViewController alloc] initWithDataController:dataController];
    [self.navigationController pushViewController:feedVC animated:YES];
}
- (void) reloadAllData
{
    LTAccount* currentAccount = [LTShareAccountManager currentAccount];
    // reload tableview data
    LTActionItem* dynamicItem = [[LTActionItem alloc] init];
    dynamicItem.title = @"我的动态";
    
    LTActionItem* aboutItem = [[LTActionItem alloc] init];
    aboutItem.title = @"关于我们";
    
    _allActions = @[dynamicItem, aboutItem];
    
    [self.tableView reloadData];
    
    //reload 用户信息
    
    [_topView.avatarImageView loadAvatarURL:LTNSURLFromString(currentAccount.userInfo.avatarURL)];
    if ([LTShareAccountManager checkApplicationAuthorization]) {
        _topView.nickNameLabel.text = currentAccount.userInfo.nickName;
    } else
    {
        _topView.nickNameLabel.text = @"未登录";
    }
    
    if (LTCurrentAccount) {
        LTUserStatsListReq* req = [LTUserStatsListReq new];
        req.userId = LTCurrentAccount.accountID;
        MSPerformRequestWithDelegateSelf(req);
    }
}

- (void) request:(MSRequest *)request onSucced:(id)object
{
    
}

- (void) request:(MSRequest *)request onError:(NSError *)error
{
    
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

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   LTActionItem* item = [_allActions objectAtIndex:indexPath.row];
    if ([item.title isEqualToString:@"我的动态"]) {
        LTMyNewsDataController* datController = [[LTMyNewsDataController alloc] init];
        LTMyNewsViewController* viewController = [[LTMyNewsViewController alloc] initWithDataController:datController];
        [self.navigationController pushViewController:viewController animated:YES];
    }
}
@end

