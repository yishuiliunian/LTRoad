//
//  LTGlobalViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTGlobalViewController.h"
#import "LTMainViewController.h"
#import "LTCarMeetViewController.h"
#import "LTDiscoverViewController.h"
#import "LTMineViewController.h"
#import "LTSelectedRoadViewController.h"
#import "MSAccountManager.h"

@interface LTGlobalViewController ()
{
    UIViewController* _mainVC;
}
@end
@implementation LTGlobalViewController
- (void) viewDidLoad
{
    [super viewDidLoad];
    if (!MSCurrentAccount) {
        [self loadApplicationMainVC];
    }
}

- (void) lt_addViewController:(UIViewController*)vc
{
    [vc willMoveToParentViewController:self];
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    vc.view.frame = self.view.bounds;
    [vc didMoveToParentViewController:self];
}

- (void) changeMainVC:(UIViewController*)vc
{
    [self lt_addViewController:vc];
}
- (void) loadApplicationMainVC
{
    LTCarMeetViewController* carMeetVC = [LTCarMeetViewController new];
    carMeetVC.tabBarItem.title = @"车友";
    
    LTDiscoverViewController* discoverVC = [LTDiscoverViewController new];
    discoverVC.tabBarItem.title = @"发现";
    LTSelectedRoadViewController* selectedVC = [LTSelectedRoadViewController new];
    selectedVC.tabBarItem.title = @"精选";
    LTMineViewController* mineVC = [LTMineViewController new];
    mineVC.tabBarItem.title = @"我的";
    
    LTMainViewController* mainVC = [[LTMainViewController alloc] init];
    mainVC.viewControllers  = @[selectedVC, discoverVC, carMeetVC, mineVC];
    
    [self changeMainVC:mainVC];
    mineVC.tabBarController.tabBar.backgroundColor = [UIColor grayColor];
    
}
@end
