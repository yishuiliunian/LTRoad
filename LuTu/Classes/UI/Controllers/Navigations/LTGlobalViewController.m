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
#import "LTNavigationController.h"
#import <DZImageCache.h>

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
    carMeetVC.tabBarItem.image = DZCachedImageByName(@"car_normal");
    carMeetVC.tabBarItem.selectedImage = DZCachedImageByName(@"car_click");
    
    LTDiscoverViewController* discoverVC = [[LTDiscoverViewController alloc] initWithLayoutType:LTLayoutTypeCover];
    discoverVC.tabBarItem.title = @"发现";
    discoverVC.tabBarItem.image = DZCachedImageByName(@"discovery_normal");
    discoverVC.tabBarItem.selectedImage = DZCachedImageByName(@"discovery_click");
    
    LTSelectedRoadViewController* selectedVC = [LTSelectedRoadViewController new];
    selectedVC.tabBarItem.title = @"精选";
    selectedVC.tabBarItem.image = DZCachedImageByName(@"choice_normal");
    selectedVC.tabBarItem.selectedImage = DZCachedImageByName(@"choice_click");
    
    LTMineViewController* mineVC = [LTMineViewController new];
    mineVC.tabBarItem.title = @"我的";
    mineVC.tabBarItem.image = DZCachedImageByName(@"user_normal");
    mineVC.tabBarItem.selectedImage = DZCachedImageByName(@"user_click");
    
    LTMainViewController* mainVC = [[LTMainViewController alloc] init];
    
    LTNavigationController*(^NavigationWithRootVC)(UIViewController* vc) = ^(UIViewController* vc) {
        return [[LTNavigationController alloc] initWithRootViewController:vc];
    };
    mainVC.viewControllers  = @[NavigationWithRootVC(selectedVC),
                                NavigationWithRootVC(discoverVC),
                                NavigationWithRootVC(carMeetVC),
                                NavigationWithRootVC(mineVC)];
    
    [self changeMainVC:mainVC];
    mineVC.tabBarController.tabBar.barTintColor = [UIColor blackColor];
    
}

- (void) viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];

}

@end
