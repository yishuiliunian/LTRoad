//
//  LTAccountManager.h
//  MoShang
//
//  Created by stonedong on 15/2/7.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTAccount.h"
#import "LTAuthViewController.h"
#import <extobjc.h>
#define LTShareAccountManager  [LTAccountManager shareManager]
#define LTCurrentAccount [LTShareAccountManager currentAccount]


#define EnsureAccountBegin \
@weakify(self) \
[LTShareAccountManager ensureApplicationAuthorization:^{ \
@strongify(self)

#define EnsureAccountEnd  }];

@interface LTAccountManager : NSObject
@property (nonatomic, strong, readonly) LTAccount* currentAccount;
+ (LTAccountManager*) shareManager;
- (void) reloadAccount:(LTAccount*)account;

/**
 *  确保当前有一个账号登陆
 */
- (void) ensureApplicationAuthorization:(LTAuthSucceedBlock)block;
- (BOOL) checkApplicationAuthorization;
@end
