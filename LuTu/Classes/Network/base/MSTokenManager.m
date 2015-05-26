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
#import "LTError.h"
@implementation MSTokenManager
+ (MSTokenManager*) shareManager {
    return DZSingleForClass([self class]);
}
- (MSToken*) loadTokenForAccount:(LTAccount*)ac
{
    if (!ac.accountID) {
        return nil;
    }
    id storeData=[[NSUserDefaults standardUserDefaults] objectForKey:ac.accountID];
    
    NSData* dicData = nil;
    if (![storeData isKindOfClass:[NSData class]]) {
        return nil;
    }
    dicData = storeData;
    
    NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:dicData options:0 error:nil];
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
        NSData* data = [NSJSONSerialization dataWithJSONObject:dic options:0 error:nil];
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:ac.accountID];
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
       _token = [self loadTokenForAccount:account];
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
    
    if (!currentAccount) {
        if (error != NULL) {
            *error = [NSError ltErrorWithCode:222 message:@"未登录任何账号"];
        }
        return NO;
    }
    
   _token = [self loadTokenForAccount:currentAccount];
    if (!_token) {
        if (error != NULL) {
            *error = [NSError ltErrorWithCode:222 message:@"没有缓存任何凭据"];
        }
    }
    return YES;
}
@end
