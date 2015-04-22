//
//  LTCarMeetDetailViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTCarMeetDetailViewController.h"
#import "LTCatMeetMemberTableViewController.h"
#import "LTCarMeetFeedViewController.h"
#import "LTCarMeetInfoViewController.h"
#import "LTCarMeetTopView.h"
@interface LTCarMeetDetailViewController ()
{
    DZSwipeViewController* _swipViewController;
    LTCarMeetTopView* _topView;
}
@end

@implementation LTCarMeetDetailViewController
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
    
    LTCarMeetInfoViewController* infoVC = [LTCarMeetInfoViewController new];
    infoVC.swipeTitle = @"简介";
    
    LTCatMeetMemberTableViewController* memberVC = [LTCatMeetMemberTableViewController new];
    memberVC.swipeTitle = @"成员";
    
    LTCarMeetFeedViewController* feedVC = [LTCarMeetFeedViewController new];
    feedVC.swipeTitle = @"动态";
    _swipViewController = [[DZSwipeViewController alloc] initWithViewControllers:@[memberVC, feedVC,infoVC]];
    //
    _topView = [[LTCarMeetTopView alloc] initWithFrame:CGRectMake(0, 0, 0, 100)];
    _swipViewController.topView = _topView;
    //
    [self lt_addViewController:_swipViewController];
    
}

- (void) viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _swipViewController.view.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
