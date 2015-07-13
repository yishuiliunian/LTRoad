//
//  SAReqManager.h
//  Pods
//
//  Created by stonedong on 15/3/11.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SAToken.h"
#define SAAuthShareManager [SAReqManager shareManager]


typedef void(^RequestAuthCompletion)(SAToken* token, NSError* error);
@interface SAReqManager : NSObject
@property (nonatomic, strong, readonly) NSString* tencentAPPID;
@property (nonatomic, strong, readonly) NSString* wechatAppId;
@property (nonatomic, strong, readonly) NSString* wecahtScret;
@property (nonatomic, strong, readonly) NSString* weiboAppID;
@property (nonatomic, strong, readonly) NSString* weiboAppSecret;
+ (SAReqManager*) shareManager;
- (BOOL) handleURL:(NSURL*)url ;
- (BOOL) canHandleURL;
- (void) requestWeiXinAuth:(RequestAuthCompletion)block;
- (void) requestQQAuth:(RequestAuthCompletion)block;
- (void) requestWeiboAuth:(RequestAuthCompletion)block;
- (void) registerTencentApp:(NSString*)appID;
- (void) registerWeiboAppID:(NSString*)appid secret:(NSString*)secret;
- (void) registerWeChatApp:(NSString*)appID scret:(NSString*)scret;
@end
