//
//  LTSelectedRoadViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTSelectedRoadViewController.h"
#import "LTRecommondLineCell.h"
#import "LTColors.h"
#import <DZImageCache.h>
#import "UIViewController+Additions.h"
#import "LTRecommondReadDataController.h"
#import "LTRouteDetailViewController.h"
#import "LTRecommendLine.h"
@interface LTSelectedRoadViewController()
@property (nonatomic, strong) LTRecommondReadDataController* dataController;
@end
@implementation LTSelectedRoadViewController

- (void) configureView
{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.backgroundColor = [UIColor clearColor];
    
    UIBarButtonItem* left = [[UIBarButtonItem alloc] initWithImage:DZCachedImageByName(@"address") style:UIBarButtonItemStyleDone target:self action:@selector(locateTheAddress)];
    self.navigationItem.leftBarButtonItem = left;
    
    [self loadNavigationBarSearchItem];
    
}
- (void) search
{
    
}
- (void) locateTheAddress
{
    
}
- (void) viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
    _dataController = [LTRecommondReadDataController new];
    _dataController.tableView = self.tableView;
    [_dataController reloadAllData];
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LTRecommendLine* line = [self.dataController objectAtIndex:indexPath.row];
    LTRouteDetailViewController* detailVC = [[LTRouteDetailViewController alloc] initWithRouteID:line.routeID];
    [self.navigationController pushViewController:detailVC animated:YES];
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

@end
