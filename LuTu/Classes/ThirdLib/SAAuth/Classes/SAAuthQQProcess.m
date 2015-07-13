//
//  SAAuthQQProcess.m
//  MiU
//
//  Created by stonedong on 15/3/13.
//  Copyright (c) 2015年 MiU. All rights reserved.
//

#import "SAAuthQQProcess.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApi.h>
#import "SAReqManager.h"
#import "SAToken.h"
@interface SAAuthQQProcess () <TencentSessionDelegate>
{
    TencentOAuth* _tencentOAuth;
}
@end
@implementation SAAuthQQProcess
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _tencentOAuth = [[TencentOAuth alloc] initWithAppId:SAAuthShareManager.tencentAPPID andDelegate:self];
    return self;
}
- (BOOL) canRequest:(NSError *__autoreleasing *)error
{
    if (![TencentOAuth iphoneQQInstalled]) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:@"com.tencent.error" code:-92 userInfo:@{NSLocalizedDescriptionKey:@"请安装QQ"}];
        }
        return NO;
    }
    return YES;
}
- (BOOL) handleOpenURL:(NSURL *)url
{
    return [TencentOAuth HandleOpenURL:url];
}

- (void) request
{
    NSArray* permissions = @[@"get_user_info", @"get_simple_userinfo"];
    [_tencentOAuth authorize:permissions inSafari:[QQApi isQQInstalled]];
}

- (void) tencentDidLogin
{
    [_tencentOAuth getUserInfo];
}

- (void) tencentDidNotLogin:(BOOL)cancelled
{
    NSError* error = [NSError errorWithDomain:@"com.tencent.error" code:-99 userInfo:@{NSLocalizedDescriptionKey:@"授权失败"}];
    
    if ([self.delegate respondsToSelector:@selector(authProcess:failtWithError:)]) {
        [self.delegate authProcess:self failtWithError:error];
    }
}

- (void) tencentDidNotNetWork
{
    NSError* error = [NSError errorWithDomain:@"com.tencent.error" code:-99 userInfo:@{NSLocalizedDescriptionKey:@"网络无效，授权失败"}];
    
    if ([self.delegate respondsToSelector:@selector(authProcess:failtWithError:)]) {
        [self.delegate authProcess:self failtWithError:error];
    }
}

- (void) getUserInfoResponse:(APIResponse *)response
{
    SAToken* token = [SAToken new];
    token.token= _tencentOAuth.accessToken;
    token.openID = _tencentOAuth.openId;
    token.userInfos = response.jsonResponse;
    token.userAvaterURL = token.userInfos[@"figureurl_qq_2"];
    token.nickName = token.userInfos[@"nickname"];
    if ([self.delegate respondsToSelector:@selector(authProcess:succeedWithToken:)]) {
        [self.delegate authProcess:self succeedWithToken:token];
    }
}
@end
