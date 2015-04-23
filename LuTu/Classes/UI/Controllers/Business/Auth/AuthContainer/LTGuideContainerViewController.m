//
//  LTGuideContainerViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/23.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTGuideContainerViewController.h"
#import "LTNavigationController.h"
#import "LTAuthViewController.h"
@interface LTGuideContainerViewController ()
@property (nonatomic, strong) LTNavigationController* authNavigationController;
@property (nonatomic, strong) LTAuthViewController* authViewController;
@end

@implementation LTGuideContainerViewController

- (void) lt_addViewController:(UIViewController*)vc
{
    [vc willMoveToParentViewController:self];
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    vc.view.frame = self.view.bounds;
    [vc didMoveToParentViewController:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadAuthViewController];
}

-  (void) loadAuthViewController
{
    _authViewController = [[LTAuthViewController alloc] initWithNibName:@"LTAuthViewController" bundle:nil];
    _authNavigationController = [[LTNavigationController alloc] initWithRootViewController:_authViewController];
    
    [self lt_addViewController:_authNavigationController];
}

- (void) viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _authNavigationController.view.frame = self.view.bounds;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
