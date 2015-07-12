//
//  LTAccountManager.m
//  MoShang
//
//  Created by stonedong on 15/2/7.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "LTAccountManager.h"
#import <DZSingletonFactory.h>
#import <DZProgramDefines.h>
#import "MSLog.h"
#import "MSTokenManager.h"
#import "AppDelegate.h"
#import "LTGlobals.h"
#import "LTUserInfo.h"
@interface LTAccountManager ()
@property (nonatomic, assign) int reloadTokenCount;
@end
@implementation LTAccountManager

+ (LTAccountManager*) shareManager
{
    return DZSingleForClass([LTAccountManager class]);
}

INIT_DZ_EXTERN_STRING(kMSStorageAccount, MSStorageAccount);
- (LTAccount*) loadAccountFromStorage
{
    NSData* data =  [[NSUserDefaults standardUserDefaults] objectForKey:kMSStorageAccount];
    if (![data isKindOfClass:[NSData class]]) {
        return nil;
    }
    NSDictionary* dic = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    if (!dic) {
        return nil;
    }
    return  [MTLJSONAdapter modelOfClass:[LTAccount class] fromJSONDictionary:dic error:nil];
}

- (void) storeAccountToStorage:(LTAccount*)account
{
    NSError* error;
    NSDictionary* dic =  [MTLJSONAdapter JSONDictionaryFromModel:account error:&error];
    if (error) {
        DDLogError(@"序列化账户信息失败");
        return;
    }
    if (!dic) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:kMSStorageAccount];
        return;
    }
    NSData* data = [NSKeyedArchiver archivedDataWithRootObject:dic];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:kMSStorageAccount];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _reloadTokenCount = 0;
    _currentAccount = [self loadAccountFromStorage];
    return self;
}
- (void) reloadAccountWithServerRsp:(PMTokenAuthRsp*)token
{
    
    MSToken* serverToken = [[MSToken alloc] initWithAccount:token.userId];
    NSDate* experiedDate =  [NSDate dateWithTimeIntervalSinceNow:1000000000];
    serverToken.experiedDate = experiedDate;
    LTAccount* account = [[LTAccount alloc] init];
    account.accountID =ENSURE_STR(token.userId);
    account.userInfo = [[LTUserInfo alloc] initWithPMTokenUserInfo:token];
    [self reloadAccount:account];
    [MSShareTokenManager cacheToken:serverToken forAccount:account];
 
}
- (void) reloadAccount:(LTAccount *)account
{
    _currentAccount = account;
    if (_currentAccount) {
        
    }
    [self storeAccountToStorage:_currentAccount];
}

- (BOOL) checkApplicationAuthorization{
    
    if (self.currentAccount) {
        if ([MSShareTokenManager isTokenVaild]) {
            return YES;
        }
    }
    return NO;
}

- (void) ensureApplicationAuthorization:(LTAuthSucceedBlock)block
{
    //OK
    if ([self checkApplicationAuthorization]) {
        if (block) {
            block();
        }
        return;
    }
    [[(AppDelegate*)[UIApplication sharedApplication].delegate globalViewController] loadAuthViewController:block];
}
@end
