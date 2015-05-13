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
}


- (void) viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
