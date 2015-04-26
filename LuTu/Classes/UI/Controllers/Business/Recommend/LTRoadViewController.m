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
@implementation LTRoadViewController
- (void) viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem* left = [[UIBarButtonItem alloc] initWithImage:DZCachedImageByName(@"address") style:UIBarButtonItemStyleDone target:self action:@selector(locateTheAddress)];
    self.navigationItem.leftBarButtonItem = left;
    [self loadNavigationBarSearchItem];
}


- (void) locateTheAddress
{
    
}
@end
