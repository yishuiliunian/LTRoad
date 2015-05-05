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
@end
@implementation LTSelectedRoadViewController


- (void) viewDidLoad
{
    [super viewDidLoad];
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
