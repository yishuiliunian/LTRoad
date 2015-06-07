//
//  LTMyFavoriteViewController.m
//  LuTu
//
//  Created by stonedong on 15/5/5.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTMyFavoriteViewController.h"
#import "LTMyFavoriteDataController.h"
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

@end
