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
#import "LTBottomLabelButton.h"
#import "UIButton+decorate.h"
#import <DZGeometryTools.h>
#import "LTBackgroundImageView.h"

#import "LTPhoneLoginViewController.h"

@interface LTAuthViewController () <MSRequestUIDelegate>
DEFINE_PROPERTY_STRONG(LTBackgroundImageView*,backgroundImageView);
DEFINE_PROPERTY_STRONG_UIImageView(logoImageView);
@property (nonatomic, strong)  UIButton* weiboButton;
@property (nonatomic, strong)  UIButton* qqButton;
@property (nonatomic, strong)  UIButton* weixinButton;
@property (nonatomic, strong) UIButton* phoneButton;
@end

@implementation LTAuthViewController

- (void) initSubViews
{
    INIT_SUBVIEW(self.view, LTBackgroundImageView, _backgroundImageView);
    INIT_SUBVIEW_UIImageView(self.view, _logoImageView);
    INIT_SUBVIEW(self.view, UIButton, _weiboButton);
    INIT_SUBVIEW(self.view, UIButton, _qqButton);
    INIT_SUBVIEW(self.view, UIButton, _weixinButton);
    INIT_SUBVIEW_UIButton(self.view, _phoneButton);
    [_weiboButton decorateWithImage:@"login_weibo_btn" highLightImage:@"login_weibo_btn_click" title:nil];
    [_qqButton decorateWithImage:@"login_qq_btn" highLightImage:@"login_qq_btn_click" title:nil];
    [_weixinButton decorateWithImage:@"login_wechat_btn" highLightImage:@"login_wechat_btn_click" title:nil];
    [_phoneButton decorateWithImage:@"login_phone_btn" highLightImage:@"login_phone_btn_click" title:nil];
    _phoneButton.imageView.contentMode = UIViewContentModeScaleToFill;
    
    //
    
    [_weixinButton addTarget:self action:@selector(handleWeixinAction:) forControlEvents:UIControlEventTouchUpInside];
    [_weiboButton addTarget:self action:@selector(handleWeiboAction:) forControlEvents:UIControlEventTouchUpInside];
    [_qqButton addTarget:self action:@selector(handleQQAction:) forControlEvents:UIControlEventTouchUpInside];
    [_phoneButton addTarget:self action:@selector(handlePhoneAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _logoImageView.image = DZCachedImageByName(@"auth_logo");
    _backgroundImageView.image = DZCachedImageByName(@"auth_bg");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.naviationBarStyle = LTNavigationStyleTransparency;
    self.title = @"";
    [self initSubViews];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handlePhoneAction:(id)sender
{
    LTPhoneLoginViewController* loginVC = [LTPhoneLoginViewController new];
    [self.navigationController pushViewController:loginVC animated:YES];
}

- (void) handleSocialToken:(SAToken*)token type:(int)type
{
        LTTokenAuthReq* req = [LTTokenAuthReq new];
        req.oAuthAccessToken= token.token;
        req.oAuthOpenId = token.openID;
        req.oAuthType = type;
        MSPerformRequestWithDelegateSelf(req);
}
- (void)handleWeiboAction:(id)sender {
    @weakify(self);
    [SAAuthShareManager requestWeiboAuth:^(SAToken *token, NSError *error) {
        @strongify(self);
        if (error) {
            MUAlertShowError(error.localizedDescription);
            return ;
        }
        [self handleSocialToken:token type:4];
    }];
}
- (void)handleQQAction:(id)sender {
    @weakify(self);
    [SAAuthShareManager requestQQAuth:^(SAToken *token, NSError *error) {
        @strongify(self);
        if (error) {
            MUAlertShowError(error.localizedDescription);
            return ;
        }
        [self handleSocialToken:token type:1];
        
    }];
}
- (void)handleWeixinAction:(id)sender {
    
    @weakify(self);
    [[SAReqManager shareManager] requestWeiXinAuth:^(SAToken *token, NSError *error) {
        @strongify(self);
        if (error) {
            MUAlertShowError(error.localizedDescription);
            return ;
        }
        [self handleSocialToken:token type:2];
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

    
    [self ltAuthSuccess];
}

- (void) request:(MSRequest *)request onError:(NSError *)error
{
    MUAlertShowError(error.localizedDescription);
}


- (void) viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    CGFloat roundBtnHeight = 80;
    CGRect buttonsRect = CGRectMake(0, CGRectGetViewControllerHeight - roundBtnHeight - 30, CGRectGetViewControllerWidth, roundBtnHeight);
    buttonsRect =  CGRectCenterSubSize(buttonsRect, CGSizeMake(50, 0));
    
    CGRect bottomRectsp[3];
    CGRectHorizontalSplit(buttonsRect,
                          bottomRectsp,
                          3,
                          (CGRectGetWidth(buttonsRect) - roundBtnHeight*3) / 2);
    _weiboButton.frame = bottomRectsp[0];
    _qqButton.frame = bottomRectsp[1];
    _weixinButton.frame = bottomRectsp[2];
    
    
    CGSize phoneSize = DZCachedImageByName(@"login_phone_btn").size;
    
    CGSize aimSize;
    aimSize.width =  CGRectGetWidth(buttonsRect);
    aimSize.height = phoneSize.height * aimSize.width / phoneSize.width;
    CGRect phoneRect = CGRectCenterOffsetSize(buttonsRect, aimSize, 20, CGRectMinYEdge);
    _phoneButton.frame = phoneRect;
    
    
    CGSize imageSize = DZCachedImageByName(@"auth_logo").size;
    imageSize = CGSizeAlignWidth(imageSize, CGRectGetViewControllerWidth/ 2);
    
    CGRect logoRect = self.view.bounds;
    logoRect.size.height = 0;
    logoRect = CGRectCenterOffsetSize(logoRect, imageSize, 100, CGRectMaxYEdge);
    
    _logoImageView.frame = logoRect;
    _backgroundImageView.frame = self.view.bounds;
    
}
@end


