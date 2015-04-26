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
{
    BOOL _needUpdateDataControllerTableView;
}
@property (nonatomic, strong) LTRecommondReadDataController* dataController;
@end
@implementation LTSelectedRoadViewController


+ (instancetype) readViewControllerWithDataController:(LTPageDataController*)dataController
{
    return [[self alloc] initWithDataController:dataController];
}

- (instancetype) initWithDataController:(LTPageDataController*)dateController
{
    self = [super init];
    if (!self) {
        return self;
    }
    _dataController = [LTRecommondReadDataController new];
    _needUpdateDataControllerTableView = YES;
    return self;
}
- (void) configureView
{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.backgroundColor = [UIColor clearColor];

}


- (void) setDataController:(LTRecommondReadDataController *)dataController
{
    if (_dataController != dataController) {
        _dataController = dataController;
        if (self.isViewLoaded) {
            _dataController.tableView = self.tableView;
        }
    }
}
- (void) viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
    if (_needUpdateDataControllerTableView) {
        _dataController.tableView = self.tableView;
        _needUpdateDataControllerTableView = NO;
    }
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
