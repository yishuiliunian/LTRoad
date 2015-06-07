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
@interface LTMyCarClubViewController () <MSRequestUIDelegate>
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
    _allCarClubs = object;
    [self.tableView reloadData];
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
    LTUIMyCarClubInfo* info = _allCarClubs[indexPath.row];
    cell.carClubInfo = info;
    return cell;
}


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [LTMyClubTableViewCell layoutCellHeight];
}
@end
