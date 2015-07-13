//
//  SAWeiboAuthProcess.m
//  Pods
//
//  Created by stonedong on 15/7/11.
//
//

#import "SAWeiboAuthProcess.h"
#import <WeiboSDK.h>
#import "SAToken.h"
@interface SAWeiboAuthProcess() <WeiboSDKDelegate>
@end
@implementation SAWeiboAuthProcess
- (BOOL) canRequest:(NSError **)error
{
    return YES;
}
- (BOOL) handleOpenURL:(NSURL *)url
{
    return [WeiboSDK handleOpenURL:url delegate:self];
}
- (void) request
{
    WBAuthorizeRequest* request = [WBAuthorizeRequest request];
    request.redirectURI = @"http://www.xunluji.com";
    [WeiboSDK sendRequest:request];
}

- (void) didReceiveWeiboResponse:(WBBaseResponse *)response
{
    if (response.statusCode != WeiboSDKResponseStatusCodeSuccess) {
        NSError* error = [NSError errorWithDomain:@"com.dzpqzb.auth" code:response.statusCode userInfo:@{NSLocalizedDescriptionKey:@"授权失败"}];
        if ([self.delegate respondsToSelector:@selector(authProcess:failtWithError:)]) {
            [self.delegate authProcess:self failtWithError:error];
        }
        return;
    }
    //
    if ([response isKindOfClass:[WBAuthorizeResponse class]]) {
        WBAuthorizeResponse* authRsp = (WBAuthorizeResponse*)response;
        SAToken* token = [[SAToken alloc] init];
        token.openID = authRsp.userID;
        token.token =  authRsp.accessToken;
        if ([self.delegate respondsToSelector:@selector(authProcess:succeedWithToken:)]) {
            [self.delegate authProcess:self succeedWithToken:token];
        }
    }
}
@end
