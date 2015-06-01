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

@interface LTSearchDataController () <UITableViewDataSource, MSRequestUIDelegate>
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



#pragma mark ---
#pragma msrequest delegate
- (void) request:(MSRequest *)request onError:(NSError *)error
{
    
}

- (void) request:(MSRequest *)request onSucced:(id)object
{
    
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
    
    return cell;
}
@end
