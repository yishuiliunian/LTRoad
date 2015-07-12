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
#import "LTAddUserInfoTableViewController.h"
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


@implementation UIViewController(Auth)

- (void) ltAuthSuccess
{
    LTAddUserInfoTableViewController* addUserInfoVC = [LTAddUserInfoTableViewController new];
    [self.navigationController pushViewController:addUserInfoVC animated:YES];

}

- (void) ltAddUserInfoSuccess
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    if ([self.navigationController isKindOfClass:[LTGuideContainerViewController class]]) {
        LTGuideContainerViewController* guide = (LTGuideContainerViewController*)self.navigationController;
        if (guide.succeedBlock) {
            guide.succeedBlock();
        }
    }
}

@end
