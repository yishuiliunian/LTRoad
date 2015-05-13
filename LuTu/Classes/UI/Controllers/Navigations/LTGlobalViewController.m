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
#import "LTAccountManager.h"
#import "LTNavigationController.h"
#import "LTGuideContainerViewController.h"
#import <DZImageCache.h>
#import "LTRoadViewController.h"
#import "LTNavigationController.h"
#import "LTAuthViewController.h"

@implementation UIViewController (GlobalNavigation)

- (LTGlobalViewController*) globalViewController
{
    if (self.parentViewController) {
        if ([self.parentViewController isKindOfClass:[LTGlobalViewController class]]) {
            return (LTGlobalViewController*)self.parentViewController;
        } else {
            return [self.parentViewController globalViewController];
        }
    } else {
        return nil;
    }
}

@end

@interface LTGlobalViewController ()
{
    UIViewController* _mainVC;
}
@end
@implementation LTGlobalViewController
- (void) viewDidLoad
{
    [super viewDidLoad];
    [self loadApplicationMainVC];
}

- (void) lt_addViewController:(UIViewController*)vc
{
    [vc willMoveToParentViewController:self];
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    vc.view.frame = self.view.bounds;
    [vc didMoveToParentViewController:self];
}

- (void) lt_removeChildViewController:(UIViewController*)vc {
    [vc willMoveToParentViewController:nil];
    [vc.view removeFromSuperview];
    [vc removeFromParentViewController];
    [vc didMoveToParentViewController:nil];
}
- (void) changeMainVC:(UIViewController*)vc
{
    [self lt_removeChildViewController:_mainVC];
    [self lt_addViewController:vc];
    _mainVC = vc;
}

- (void) loadGuideViewController
{
    LTGuideContainerViewController* guidVC = [LTGuideContainerViewController new];
    [self changeMainVC:guidVC];
}
- (void) loadApplicationMainVC
{
    LTCarMeetViewController* carMeetVC = [LTCarMeetViewController new];
    carMeetVC.tabBarItem.title = @"车友";
    carMeetVC.tabBarItem.image = DZCachedImageByName(@"car_normal");
    carMeetVC.tabBarItem.selectedImage = DZCachedImageByName(@"car_click");
    
    LTDiscoverViewController* discoverVC = [[LTDiscoverViewController alloc] initWithLayoutType:LTLayoutTypeGrid];
    discoverVC.tabBarItem.title = @"发现";
    discoverVC.tabBarItem.image = DZCachedImageByName(@"discovery_normal");
    discoverVC.tabBarItem.selectedImage = DZCachedImageByName(@"discovery_click");
    
    LTSelectedRoadViewController* selectedVC = [[LTRoadViewController alloc ] initWithDataController:[LTRecommondReadDataController new]];
    
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

-  (void) loadAuthViewController:(LTAuthSucceedBlock)block
{
    LTAuthViewController* authViewController  = [[LTAuthViewController alloc] initWithNibName:@"LTAuthViewController" bundle:nil];
    authViewController.succeedBlock = block;
    LTNavigationController* nav = [[LTNavigationController alloc] initWithRootViewController:authViewController];
    [self presentViewController:nav animated:YES completion:nil];
}
@end
