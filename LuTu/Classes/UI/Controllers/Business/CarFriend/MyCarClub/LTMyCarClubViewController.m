//
//  LTMyCarClubViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/29.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTMyCarClubViewController.h"
#import "LTUserCarClubListReq.h"
#import "LTMyClubTableViewCell.h"
#import "LTCarClubMemberQuitReq.h"
#import "MUAlertPool.h"
@interface LTMyCarClubViewController () <MSRequestUIDelegate, LTClubActionProtocol>
{
    NSArray* _allCarClubs;
}
@end

static NSString* kCarClubViewCellIdentifier = @"kCarClubViewCellIdentifier";
@implementation LTMyCarClubViewController

- (instancetype) initWithUID:(NSString *)uid
{
    self = [super init];
    if (!self) {
        return self;
    }
    _uid = uid;
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerClass:[LTMyClubTableViewCell class] forCellReuseIdentifier:kCarClubViewCellIdentifier];
    self.title = @"我的车友会";
    [self reloadAllData];
}

- (void) reloadAllData
{
    LTUserCarClubListReq* clubsReq = [LTUserCarClubListReq new];
    clubsReq.userId = self.uid;
    MSPerformRequestWithDelegateSelf(clubsReq);

}

- (void) request:(MSRequest *)request onError:(NSError *)error
{
    
}

- (void) request:(MSRequest *)request onSucced:(id)object
{
    if ([request isKindOfClass:[LTUserCarClubListReq class]]) {
        _allCarClubs = object;
        [self.tableView reloadData];
    } else if ([request isKindOfClass:[LTCarClubMemberQuitReq class]]) {
       
        MUAlertShowSuccess(@"您已经成功退出");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _allCarClubs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LTMyClubTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCarClubViewCellIdentifier forIndexPath:indexPath];
    LTUICarMeet* info = _allCarClubs[indexPath.row];
    cell.actionTarget = self;
    cell.carClubInfo = info;
    return cell;
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [LTMyClubTableViewCell layoutCellHeight];
}

- (void) clubTableViewCell:(LTMyClubTableViewCell *)cell toggleActionWithMeet:(LTUICarMeet *)meet
{
    LTCarClubMemberQuitReq* quitReq = [LTCarClubMemberQuitReq new];
    quitReq.carClubId = meet.clubID;
    [MSDefaultSyncCenter performRequest:quitReq];
    MUAlertShowLoading(@"退出中.....");
    

}
@end
