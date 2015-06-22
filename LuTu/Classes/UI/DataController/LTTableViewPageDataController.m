//
//  LTTableViewPageDataController.m
//  LuTu
//
//  Created by stonedong on 15/5/5.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTTableViewPageDataController.h"
#import "LTGlobals.h"
#import <MJRefresh.h>
@implementation LTTableViewPageDataController

- (void) setObjectMapCell:(NSDictionary *)objectMapCell
{
    if (_objectMapCell != objectMapCell) {
        _objectMapCell = objectMapCell;
        [self registerTableClass];
    }
}

- (void) registerTableClass
{
    for (NSString* key in _objectMapCell.allKeys) {
        [_tableView registerClass:_objectMapCell[key] forCellReuseIdentifier:key];
    }
}
- (void) setTableView:(UITableView *)tableView
{
    if (_tableView != tableView) {
        _tableView = tableView;
        _tableView.dataSource = self;
        [self registerTableClass];
        _tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(getNextPageData)];
    }
}

- (void) setTableViewController:(UITableViewController *)tableViewController
{
    if (_tableViewController != tableViewController) {
        _tableViewController = tableViewController;
        _tableViewController.refreshControl = [UIRefreshControl new];
        [_tableViewController.refreshControl addTarget:self action:@selector(reloadAllData) forControlEvents:UIControlEventValueChanged];
    }
}
- (void) handleReloadData:(NSArray *)data
{
    [super handleReloadData:data];
    [_tableViewController.refreshControl endRefreshing];
}


- (void) handleNextPageData:(NSArray *)data
{
    [super handleNextPageData:data];
    [_tableView.footer endRefreshing];
}
- (void) reloadUIAllUIData
{
    [self.tableView reloadData];
}
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id line = _array[indexPath.row];
    NSString* const kCellIdentifier = LTCellIdentifierFromClass([line class]);
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    [self decorateCell:cell withObject:line];
    return cell;
}
@end
