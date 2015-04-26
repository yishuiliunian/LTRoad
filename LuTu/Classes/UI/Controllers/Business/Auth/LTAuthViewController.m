//
//  LTAuthViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/23.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTAuthViewController.h"
#import <SAReqManager.h>
#import "LTTokenReq.h"
#import <extobjc.h>
#import "MSTokenManager.h"
#import "LTAccountManager.h"
#import "LTGlobalViewController.h"
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
        LTTokenReq* req = [LTTokenReq new];
        req.accessToken = token.token;
        req.openID = token.openID;
        MSPerformRequestWithDelegateSelf(req);
    }];
}
- (void) request:(MSRequest *)request onSucced:(id)object
{
    LTTokenReq* req = (LTTokenReq*)request;
    MSToken* token = (MSToken*)object;
    LTAccount* account = [[LTAccount alloc] init];
    account.accountID = token.account;
    account.openId = req.openID;
    account.openAccessToken = req.accessToken;
    [[LTAccountManager shareManager] reloadAccount:account];
    [MSShareTokenManager cacheToken:token forAccount:account];
    
    [self.globalViewController viewController:self didEnterAccount:account];
}

- (void) request:(MSRequest *)request onError:(NSError *)error
{
    
}
@end
