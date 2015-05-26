//
//  UIViewController+LTNavigationBar.m
//  LuTu
//
//  Created by stonedong on 15/4/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "UIViewController+LTNavigationBar.h"
#import "LTNavigationTitleView.h"
#import <objc/runtime.h>

static char UIViewControllerTitleKey;
static char UIViewControllerSubtitleKey;
@implementation UIViewController (LTNavigationBar)
@dynamic title;
@dynamic subtitle;

- (NSString *)title
{
    return objc_getAssociatedObject(self, &UIViewControllerTitleKey);
}

- (void)setTitle:(NSString *)title
{
    [self willChangeValueForKey:@"title"];
    objc_setAssociatedObject(self, &UIViewControllerTitleKey, title, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self didChangeValueForKey:@"title"];
    [self updateTitleTo:title];
    self.navigationItem.title = title;
}

- (NSString *)subtitle
{
    return objc_getAssociatedObject(self, &UIViewControllerSubtitleKey);
}

- (void)setSubtitle:(NSString *)subtitle
{
    [self willChangeValueForKey:@"subtitle"];
    objc_setAssociatedObject(self, &UIViewControllerSubtitleKey, subtitle, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self didChangeValueForKey:@"subtitle"];
    [self updateSubtitleTo:subtitle];
}

- (void)updateTitleTo:(NSString *)title
{
    if ([self.navigationItem.titleView isKindOfClass:[LTNavigationTitleView class]]) {
        [(LTNavigationTitleView*) self.navigationItem.titleView setNavigationBarTitle:title];
    }
}

- (void)updateSubtitleTo:(NSString *)subtitle
{
    if ([self.navigationItem.titleView isKindOfClass:[LTNavigationTitleView class]]) {
        [(LTNavigationTitleView *) self.navigationItem.titleView setNavigationBarSubtitle:subtitle];
    }
}


@end
