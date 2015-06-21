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
#import "LTUIRouteSearchInfo.h"
#import "LTRouteDetailViewController.h"
#import "LTUICarMeetFeed.h"
#import "LTFeedDetailViewController.h"
#import "LTMyCarClubViewController.h"
#import "LTGlobals.h"
#import <DZProgramDefines.h>
#import "LTUICarMeet.h"
#import "LTCarMeetDetailViewController.h"
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
    } else if ([object isKindOfClass:[LTUICarMeet class]]) {
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

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id object = [self.dataController objectAtIndexPath:indexPath];
    if ([object isKindOfClass:[LTUIRouteSearchInfo class]]) {
        LTUIRouteSearchInfo * info = object;
        LTRouteDetailViewController* vc = [[LTRouteDetailViewController alloc] initWithRouteID:info.routeId];
        [self.navigationController pushViewController:vc animated:YES];
    } else if ([object isKindOfClass:[LTUICarMeetFeed class]]) {
        LTUICarMeetFeed* feed = (LTUICarMeetFeed*)object;
        LTFeedDetailViewController* detailVC = [LTFeedDetailViewController new];
        detailVC.hidesBottomBarWhenPushed = YES;
        detailVC.carFeedInfo = feed;
        [self.navigationController pushViewController:detailVC animated:YES];
    } else if ([object isKindOfClass:[LTUICarMeet class] ]) {
        LTUICarMeet* info = (LTUICarMeet*)object;
        LTCarMeetDetailViewController* clubViewController = [[LTCarMeetDetailViewController alloc] initWithCarClub:info];
        [self.navigationController pushViewController:clubViewController animated:YES];
        
    }
}
@end
