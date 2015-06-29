//
//  LTAuthViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/23.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTAuthViewController.h"
#import <SAReqManager.h>
#import "LTTokenAuthReq.h"
#import <extobjc.h>
#import "MSTokenManager.h"
#import "LTAccountManager.h"
#import "LTGlobalViewController.h"
#import "MSToken.h"
#import "LTGlobals.h"
#import "PMTokenAuthRsp.h"
@interface LTAuthViewController () <MSRequestUIDelegate>

@end

@implementation LTAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleWeiboAction:(id)sender {
    
}
- (IBAction)handleQQAction:(id)sender {
    
}
- (IBAction)handleWeixinAction:(id)sender {
    
    @weakify(self);
    [[SAReqManager shareManager] requestWeiXinAuth:^(SAToken *token, NSError *error) {
        @strongify(self);
        if (error) {
            return ;
        }
        LTTokenAuthReq* req = [LTTokenAuthReq new];
        req.oAuthAccessToken= token.token;
        req.oAuthOpenId = token.openID;
        req.oAuthType = 2;
        MSPerformRequestWithDelegateSelf(req);
    }];
}
- (void) request:(MSRequest *)request onSucced:(id)object
{
    LTTokenAuthReq* req = (LTTokenAuthReq*)request;
    PMTokenAuthRsp* token = (PMTokenAuthRsp*)object;
    
    MSToken* serverToken = [[MSToken alloc] initWithAccount:token.userId];
    NSDate* experiedDate =  [NSDate dateWithTimeIntervalSinceNow:1000000000];
    serverToken.experiedDate = experiedDate;
    LTAccount* account = [[LTAccount alloc] init];
    account.accountID =ENSURE_STR(token.userId);
    account.openId = req.oAuthOpenId;
    account.openAccessToken = req.oAuthAccessToken;
    account.userInfo = [[LTUserInfo alloc] initWithPMTokenUserInfo:token];
    [[LTAccountManager shareManager] reloadAccount:account];
    [MSShareTokenManager cacheToken:serverToken forAccount:account];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    if (self.succeedBlock) {
        self.succeedBlock();
    }
}

- (void) request:(MSRequest *)request onError:(NSError *)error
{
    MUAlertShowError(error.localizedDescription);
}
@end
