//
//  LTAccountManager.h
//  MoShang
//
//  Created by stonedong on 15/2/7.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTAccount.h"

#define LTShareAccountManager  [LTAccountManager shareManager]
#define LTCurrentAccount [LTShareAccountManager currentAccount]
@interface LTAccountManager : NSObject
@property (nonatomic, strong, readonly) LTAccount* currentAccount;
+ (LTAccountManager*) shareManager;
- (void) reloadAccount:(LTAccount*)account;
@end
