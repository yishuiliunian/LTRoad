//
//  LTMyFavoriteViewController.m
//  LuTu
//
//  Created by stonedong on 15/5/5.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTMyFavoriteViewController.h"
#import "LTMyFavoriteDataController.h"
#import "LTUIRouteSearchInfo.h"
#import "LTRouteDetailViewController.h"
@interface LTMyFavoriteViewController ()

@end

@implementation LTMyFavoriteViewController

+ (LTMyFavoriteViewController*) myFavoriteViewController
{
    LTMyFavoriteDataController* dataController = [LTMyFavoriteDataController new];
    LTMyFavoriteViewController* myFavorateVC = [[LTMyFavoriteViewController alloc] initWithDataController:dataController];
    return myFavorateVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的收藏";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LTUIRouteSearchInfo * info = [self.dataController objectAtIndex:indexPath.row];
    LTRouteDetailViewController* vc = [[LTRouteDetailViewController alloc] initWithRouteID:info.routeId];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
