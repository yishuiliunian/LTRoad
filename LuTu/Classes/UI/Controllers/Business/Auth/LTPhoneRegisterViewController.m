//
//  LTPhoneRegisterViewController.m
//  LuTu
//
//  Created by stonedong on 15/7/12.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTPhoneRegisterViewController.h"
#import "LTUserRegisterPhoneReq.h"
#import "MUAlertPool.h"
#import "LTGuideContainerViewController.h"
@interface LTPhoneRegisterViewController () <MSRequestUIDelegate>

@end

@implementation LTPhoneRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.sendButton addTarget:self action:@selector(registerUser) forControlEvents:UIControlEventTouchUpInside];
    [self.sendButton setTitle:@"注册" forState:UIControlStateNormal];
    self.title = @"注册";
}
- (void) registerUser
{
    if (![self checkInputVaild]) {
        return;
    }
    LTUserRegisterPhoneReq* req = [LTUserRegisterPhoneReq new];
    req.phone = self.phoneTextField.text;
    req.password = self.passwordTextField.text;
    MSPerformRequestWithDelegateSelf(req);
    MUAlertShowLoading(@"注册中...");
}

- (void) request:(MSRequest *)request onError:(NSError *)error
{
    MUAlertShowError(error.localizedDescription);
}

- (void) request:(MSRequest *)request onSucced:(id)object
{
    MUAlertShowSuccess(@"注册成功");
    [self ltAuthSuccess];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
