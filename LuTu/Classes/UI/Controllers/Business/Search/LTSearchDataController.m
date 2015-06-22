//
//  LTSearchDataController.m
//  LuTu
//
//  Created by stonedong on 15/5/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTSearchDataController.h"
#import "LTGlobals.h"
#import "LTCarMeetFeedCell.h"
#import "LTMyClubTableViewCell.h"
#import "LTSearchReq.h"
#import "LTUIRouteSearchInfo.h"
#import "LTSearchRouteTableViewCell.h"
#import "LTCarClubMemberJoinReq.h"

@interface LTSearchDataController () <UITableViewDataSource, MSRequestUIDelegate, LTClubActionProtocol>
{
    NSArray* _allDatas;
}
@end
@implementation LTSearchDataController

- (void) setTableView:(UITableView *)tableView
{
    if (_tableView != tableView) {
        _tableView = tableView;
        _tableView.dataSource = self;
        
        [self.tableView registerClass:[LTCarMeetFeedCell class] forCellReuseIdentifier:LTCellIdentifierFromClass([LTUICarMeetFeed class])];
        [self.tableView registerClass:[LTMyClubTableViewCell class] forCellReuseIdentifier:LTCellIdentifierFromClass([LTUICarMeet class])];
        [self.tableView registerClass:[LTSearchRouteTableViewCell class] forCellReuseIdentifier:LTCellIdentifierFromClass([LTUIRouteSearchInfo class])];
    }
}
- (NSUInteger) sectionCount
{
    return _allDatas.count;
}

- (NSUInteger) numberOfObjectAtSection:(NSInteger)section
{
    return [_allDatas[section] count];
}

- (NSObject*) objectAtRow:(NSUInteger) row section:(NSUInteger)section
{
    return _allDatas[section][row];
}


- (void) searchKeyword:(NSString*)keyword
{
    LTSearchReq* searchReq = [LTSearchReq new];
    searchReq.keyword = keyword;
    searchReq.city = LTShareSettings().currentCity;
    MSPerformRequestWithDelegateSelf(searchReq);
}

- (id) objectAtIndexPath:(NSIndexPath *)indexPath
{
    return _allDatas[indexPath.section][indexPath.row];
}




#pragma mark ---
#pragma msrequest delegate
- (void) request:(MSRequest *)request onError:(NSError *)error
{
    MUAlertShowError(error.localizedDescription);
}

- (void) request:(MSRequest *)request onSucced:(id)object
{
    if ([request isKindOfClass:[LTSearchReq class]]) {
        PMSearchRsp* rsp = (PMSearchRsp*)object;
        NSMutableArray* clubArray = [NSMutableArray new];
        NSMutableArray* routeArray = [NSMutableArray new];
        NSMutableArray* threadArray = [NSMutableArray new];
        
        for (PMClubSearchInfo* sInfo in rsp.clubs) {
            LTUICarMeet* info = [[LTUICarMeet alloc] initWithSearchInfo:sInfo];
            [clubArray addObject:info];
        }
        
        for (PMRouteSearchInfo* rInfo in rsp.routes) {
            LTUIRouteSearchInfo* info = [[LTUIRouteSearchInfo alloc] initWithRouteInfo:rInfo];
            [routeArray addObject:info];
        }
        
        for (PMThreadInfo* tInfo in rsp.threads) {
            LTUICarMeetFeed* feed = [[LTUICarMeetFeed alloc] initWithThreadInfo:tInfo];
            [threadArray addObject:feed];
        }
        
        NSMutableArray* array = [NSMutableArray new];
        if (routeArray.count) {
            [array addObject:routeArray];
        }
        if (threadArray.count) {
            [array addObject:threadArray];
        }
        if (clubArray.count) {
            [array addObject:clubArray];
        }
        
        _allDatas = array;
        [self.tableView reloadData];
    } else if ([request isKindOfClass:[LTCarClubMemberJoinReq class]]) {
        MUAlertShowSuccess(@"您已经成功加入");
    }
}

- (NSString*) headerViewIdentifierForSection:(NSInteger)section
{
    id object = _allDatas[section][0];
    if ([object isKindOfClass:[LTUICarMeet class]]) {
        return @"圈子";
    } else if ([object isKindOfClass:[LTUICarMeetFeed class]])
    {
        return @"帖子";
    } else if ([object isKindOfClass:[LTUIRouteSearchInfo class]]){
        return @"路线";
    }
    return @"";
}
//
#pragma mark ----
#pragma tableview delegate

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sectionCount;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self numberOfObjectAtSection:section];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSObject* object = [self objectAtRow:indexPath.row section:indexPath.section];
    NSString* key = LTCellIdentifierFromClass(object.class);
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:key forIndexPath:indexPath];
    if ([cell isKindOfClass:[LTMyClubTableViewCell class]]) {
        [(LTMyClubTableViewCell*)cell setCarClubInfo:(LTUICarMeet*)object];
        [(LTMyClubTableViewCell*)cell showInfoWithEnter];
        [(LTMyClubTableViewCell*)cell setActionTarget:self];
    } else if ([cell isKindOfClass:[LTCarMeetFeedCell class]]) {
        [(LTCarMeetFeedCell*)cell setCarMeetFeed:(LTUICarMeetFeed *)object];
    } else if ([cell isKindOfClass:[LTSearchRouteTableViewCell class]]) {
        [(LTSearchRouteTableViewCell*)cell setRouteInfo:(LTUIRouteSearchInfo *)object];
    }
    return cell;
}

- (void) clubTableViewCell:(LTMyClubTableViewCell *)cell toggleActionWithMeet:(LTUICarMeet *)meet
{
    LTCarClubMemberJoinReq* req = [LTCarClubMemberJoinReq new];
    req.carClubId = meet.clubID;
    req.userId = LTCurrentAccount.accountID;
    req.uidelegate = self;
    [MSDefaultSyncCenter performRequest:req];
    MUAlertShowLoading(@"正在加入...");
}

@end
