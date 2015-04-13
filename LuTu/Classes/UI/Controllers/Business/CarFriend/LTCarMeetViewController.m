//
//  LTCarMeetViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTCarMeetViewController.h"
#import "DZExpandSwipViewController.h"
@interface LTCarMeetViewController()
@property (nonatomic, strong) DZExpandSwipViewController* swipViewController;
@end
@implementation LTCarMeetViewController

- (void) lt_addViewController:(UIViewController*)vc
{
    [vc willMoveToParentViewController:self];
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    vc.view.frame = self.view.bounds;
    [vc didMoveToParentViewController:self];
}
- (void) viewDidLoad
{
    [super viewDidLoad];
    _swipViewController = [DZExpandSwipViewController new];
    [self lt_addViewController:_swipViewController];
}

- (void) viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _swipViewController.view.frame = self.view.bounds;
    
}
@end
