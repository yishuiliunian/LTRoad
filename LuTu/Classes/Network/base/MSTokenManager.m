//
//  MSTokenManager.m
//  MoShang
//
//  Created by stonedong on 15/2/4.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "MSTokenManager.h"
#import <DZSingletonFactory.h>
#import "LTAccountManager.h"
#import "LTAccountManager.h"
@implementation MSTokenManager
+ (MSTokenManager*) shareManager {
    return DZSingleForClass([self class]);
}
- (MSToken*) loadTokenForAccount:(LTAccount*)ac
{
    NSDictionary* dic =[[NSUserDefaults standardUserDefaults] objectForKey:ac.accountID];
    if (dic) {
        MSToken* token = [[MSToken alloc] initWithDictionary:dic error:nil];
        if (token) {
            return token;
        }
    }
    return nil;
    
}

- (void) storeTokenToLocalForAccount:(LTAccount*)ac
{
    NSDictionary* dic = [_token dictionaryValue];
    if (dic && ac) {
        [[NSUserDefaults standardUserDefaults] setObject:dic forKey:ac.accountID];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    LTAccount* account = LTCurrentAccount;
    if (account) {
        [self loadTokenForAccount:account];
    }
    return self;
}


- (void) cacheToken:(MSToken *)token forAccount:(id)ac
{
    NSParameterAssert(token);
    NSParameterAssert(ac);
    _token = token;
    [self storeTokenToLocalForAccount:ac];
}

- (BOOL) isTokenVaild
{
    if (!_token) {
        return NO;
    }
    if (!_token.token || !_token.account) {
        return NO;
    }
    if (!_token.experiedDate) {
        return NO;
    }
    
    if ([_token.experiedDate timeIntervalSinceNow] < 0) {
        return NO;
    }
    
    return YES;
}

- (BOOL) revarifyCacheToken:(NSError *__autoreleasing *)error
{
    if ([self isTokenVaild]) {
        return YES;
    }
    
    LTAccount* currentAccount = LTCurrentAccount;
//    if (!currentAccount) {
//        *error = [NSError ms_errorWithMessage:@"未登录任何账号" code:-9999];
//        return NO;
//    }
//    
//    MSLoginReq* req = [MSLoginReq new];
//    req.accountID = currentAccount.accountID;
//    req.password = currentAccount.password;
//    if (![req doRequst]) {
//        *error = req.lastError;
//        return NO;
//    }
//    _token = [[MSToken alloc] initWithToken:req.token account:currentAccount.accountID];
    return YES;
}
@end
