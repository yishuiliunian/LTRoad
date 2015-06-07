//
//  LTSearchTableViewController.m
//  LuTu
//
//  Created by stonedong on 15/5/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTSearchTableViewController.h"
#import <DZGeometryTools.h>
#import "LTSearchDataController.h"
#import "LTTableSectionView.h"
#import "LTGlobals.h"

@interface LTSearchTableViewController () <UISearchBarDelegate>
@property (nonatomic, strong) UISearchBar* searchBar;
@property (nonatomic, strong) LTSearchDataController* dataController;
@end



@implementation LTSearchTableViewController

- (void) initDataController
{
    _dataController = [LTSearchDataController new];
    _dataController.tableView = self.tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(CGRectLoadViewFrame), 44)];
    _searchBar.delegate = self;
    self.navigationItem.titleView = _searchBar;
    [_searchBar setShowsCancelButton:YES];
    self.navigationController.navigationBar.backgroundColor = [UIColor blackColor];
    //
    [self initDataController];
    [_searchBar becomeFirstResponder];
}

- (void) searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [_dataController searchKeyword:searchBar.text];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id object = [_dataController objectAtIndexPath:indexPath];
    if ([object isKindOfClass:[LTUICarMeetFeed class]]) {
        return 100;
    } else if ([object isKindOfClass:[LTUIMyCarClubInfo class]]) {
        return 80;
    } else {
        return 80;
    }
}

- (UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSString* key = [_dataController headerViewIdentifierForSection:section];
    LTTableSectionView* sectionView = (LTTableSectionView*) [tableView dequeueReusableHeaderFooterViewWithIdentifier:key];
    if (!sectionView) {
        sectionView = [LTTableSectionView new];
    }
    sectionView.textLabel.text = key;
    return sectionView;
}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
- (UIView*) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    NSString* key = [[_dataController headerViewIdentifierForSection:section] stringByAppendingString:@"footer"];
    UIView* aView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:key];
    if (!aView) {
        aView = [UIView new];
    }
    aView.backgroundColor = LTColorBackgroundGray();
    return aView;
}
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20;
}
@end
