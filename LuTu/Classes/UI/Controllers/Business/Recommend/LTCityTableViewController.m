//
//  LTCityTableViewController.m
//  LuTu
//
//  Created by stonedong on 15/5/12.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTCityTableViewController.h"
#import "LTCityReq.h"
#import "PMCity.h"
#import "LTUserDataManager.h"
@interface LTCityCell : UITableViewCell

@end

@implementation LTCityCell

@end
@interface LTCityTableViewController () <MSRequestUIDelegate>
{
    NSArray* _allCitys;
}
@end

@implementation LTCityTableViewController

static NSString* const kCellCityIdentifier = @"kCellCityIdentifier";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[LTCityCell class] forCellReuseIdentifier:kCellCityIdentifier];
    [self reloadAllData];
}

- (void) reloadAllData
{
    LTCityReq* req = [LTCityReq new];
    MSPerformRequestWithDelegateSelf(req);
}

- (void) request:(MSRequest *)request onError:(NSError *)error
{
    
}

- (void) request:(MSRequest *)request onSucced:(id)object
{
    _allCitys = object;
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
    return _allCitys.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellCityIdentifier forIndexPath:indexPath];
    PMCity* city = _allCitys[indexPath.row];
    cell.textLabel.text = city.name;
    return cell;
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PMCity* city = _allCitys[indexPath.row];
    LTShareSettings().currentCity = city.cityID;
    LTLocalizedSettings();
    [self dismissSelfViewController];
}

- (void) dismissSelfViewController
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
@end
