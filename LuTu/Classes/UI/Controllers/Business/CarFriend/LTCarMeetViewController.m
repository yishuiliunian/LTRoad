//
//  LTCarMeetViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTCarMeetViewController.h"
#import "DZExpandSwipViewController.h"
#import <DZImageCache.h>
#import "UIViewController+Additions.h"
#import <DZGeometryTools.h>
#import "LTAppearenceTools.h"
#import "LTAddThreadViewController.h"
#import "UIViewController+Additions.h"
@interface LTCarMeetViewController()
{
    UIScrollView* _scrollView;
}
@property (nonatomic, strong) DZExpandSwipViewController* swipViewController;
@end
@implementation LTCarMeetViewController
- (void) loadView
{
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:CGRectLoadViewFrame];
    self.view = scrollView;
    _scrollView = scrollView;
}

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
    self.edgesForExtendedLayout = UIRectEdgeNone;
    _swipViewController = [DZExpandSwipViewController new];
    [self lt_addViewController:_swipViewController];
    
    UIBarButtonItem* left = [[UIBarButtonItem alloc] initWithImage:DZCachedImageByName(@"posts") style:UIBarButtonItemStyleDone target:self action:@selector(postFeed)];
    self.navigationItem.leftBarButtonItem = left;
    
    [self loadNavigationBarSearchItem];
    
    self.title = @"圈子";
    self.naviationBarStyle = LTNavigationStyleTransparency;
    
}
- (void) postFeed
{
    LTAddThreadViewController* vc = [LTAddThreadViewController new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (void) viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _swipViewController.view.frame = self.view.bounds;
    _scrollView.contentSize = self.view.bounds.size;
}
@end
