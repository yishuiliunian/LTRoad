//
//  LTNavigationController.m
//  LuTu
//
//  Created by stonedong on 15/4/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTNavigationController.h"
#import <UINavigationBar+Awesome.h>
#import "UIViewController+MethodSwizzling.h"
#import <DZImageCache.h>
#import "LTNavigationTitleView.h"
@interface LTNavigationController ()

@end

@implementation LTNavigationController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTitleViewToViewController:self.topViewController];
    self.navigationBar.clipsToBounds = YES;
}
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    static int tag = 99999;
    UIImageView* backgroundImageView = (UIImageView*)[self.view viewWithTag:tag];
    if (!backgroundImageView) {
        backgroundImageView = [[UIImageView alloc] initWithImage:DZCachedImageByName(@"bg")];
        [self.view addSubview:backgroundImageView];
    }
    [self.view insertSubview:backgroundImageView atIndex:0];
    backgroundImageView.frame = self.view.bounds;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self addTitleViewToViewController:viewController];
    [super pushViewController:viewController animated:animated];
}

- (void)addTitleViewToViewController:(UIViewController *)viewController
{
    if (!viewController.navigationItem.titleView) {
        CGFloat width = 0.95 * self.view.frame.size.width;
        LTNavigationTitleView *titleView = [[LTNavigationTitleView alloc] initWithFrame:CGRectMake(0, 0, width, 44)];
        viewController.navigationItem.titleView = titleView;
        viewController.title = viewController.title.length ? viewController.title : viewController.navigationItem.title;
    }
}


@end
