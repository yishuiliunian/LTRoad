//
//  MUAlertPool.m
//  MoShang
//
//  Created by stonedong on 15/2/15.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import <DZSingletonFactory.h>
#import <SVProgressHUD.h>
#import "MUAlertPool.h"
#import "LTGlobals.h"
@interface MUAlertPool ()
{
}
@end
@implementation MUAlertPool
+ (MUAlertPool*) defaultPool
{
    return DZSingleForClass([self class]);
}

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    [SVProgressHUD setBackgroundColor:LTColorBalckAlpha8()];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    return self;
}

- (void) hideAllAlert
{
    [SVProgressHUD dismiss];
}
- (void) showLoadingWithMessage:(NSString*)msg
{
    [self showHUDLoadingWithMessage:msg];
}

- (void) showErrorWithMessage:(NSString *)msg
{
    [self showHUDFailureWithMessage:msg];
}

- (void) showSuccessWithMessage:(NSString *)msg
{
    [self showHUDSccessWithMessage:msg];
}

- (void)showHUDLoadingWithMessage:(NSString *)message
{
    [SVProgressHUD showWithStatus:message];
}
- (void)showHUDStatusWithMessag:(NSString *)message
{
    [SVProgressHUD showInfoWithStatus:message];
}

- (void)showHUDSccessWithMessage:(NSString *)message
{
    [SVProgressHUD showSuccessWithStatus:message];
}

- (void)showHUDFailureWithMessage:(NSString *)message
{
    [SVProgressHUD showErrorWithStatus:message];
}

@end
