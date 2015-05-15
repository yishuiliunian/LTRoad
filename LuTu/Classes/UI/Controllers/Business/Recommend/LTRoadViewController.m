//
//  LTRoadViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/26.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTRoadViewController.h"
#import <DZImageCache.h>
#import "UIViewController+Additions.h"
#import "LTCityTableViewController.h"
#import "LTNavigationController.h"
@implementation LTRoadViewController
- (void) viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem* left = [[UIBarButtonItem alloc] initWithImage:DZCachedImageByName(@"location") style:UIBarButtonItemStyleDone target:self action:@selector(locateTheAddress)];
    self.navigationItem.leftBarButtonItem = left;
    [self loadNavigationBarSearchItem];
    
    
    
}


- (void) locateTheAddress
{
    LTCityTableViewController* cityVC = [LTCityTableViewController new];
    LTNavigationController* nav = [[LTNavigationController alloc] initWithRootViewController:cityVC];
    [self presentViewController:nav animated:YES completion:nil];
}
@end
