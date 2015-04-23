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
    NSDictionary* dic = [[NSUserDefaults standardUserDefaults] objectForKey:kMSStorageAccount];
    if (!dic) {
        return nil;
    }
    return [[LTAccount alloc] initWithDictionary:dic error:nil];
}

- (void) storeAccountToStorage:(LTAccount*)account
{
    NSDictionary* dic = [account dictionaryValue];
    if (!dic) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:kMSStorageAccount];
        return;
    }
    [[NSUserDefaults standardUserDefaults] setObject:dic forKey:kMSStorageAccount];
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

- (void) reloadAccount:(LTAccount *)account
{
    _currentAccount = account;
    if (_currentAccount) {
        
    }
    [self storeAccountToStorage:_currentAccount];
}




@end
