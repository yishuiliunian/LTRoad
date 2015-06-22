//
//  MUAlertPool.h
//  MoShang
//
//  Created by stonedong on 15/2/15.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import <Foundation/Foundation.h>
#define MUDefaultAlertPool [MUAlertPool defaultPool]

#define MUAlertShowLoading(mssage) [MUDefaultAlertPool showLoadingWithMessage:mssage];
#define MUAlertHideLoading  [MUDefaultAlertPool hideAllAlert];
#define MUAlertShowError(message) [MUDefaultAlertPool showErrorWithMessage:message];
#define MUAlertShowSuccess(message) [MUDefaultAlertPool showSuccessWithMessage:message];

#define MUAlertHUDLoading(message) [MUDefaultAlertPool showHUDLoadingWithMessage:message];
#define MUAlertHUDShowStatus(message) [MUDefaultAlertPool showHUDStatusWithMessag:message];
#define MUAlertHUDSuccess(message) [MUDefaultAlertPool showHUDSccessWithMessage:message];
#define MUAlertHUDFailure(message) [MUDefaultAlertPool showHUDFailureWithMessage:message];

@interface MUAlertPool : NSObject
+ (MUAlertPool*) defaultPool;
- (void) showLoadingWithMessage:(NSString*)msg;
- (void) showErrorWithMessage:(NSString *)msg;
- (void) showSuccessWithMessage:(NSString *)msg;

- (void) showHUDLoadingWithMessage:(NSString *)msg;
- (void) showHUDStatusWithMessag:(NSString *)message;
- (void) showHUDSccessWithMessage:(NSString *)message;
- (void) showHUDFailureWithMessage:(NSString *)message;
- (void) hideAllAlert;
@end
