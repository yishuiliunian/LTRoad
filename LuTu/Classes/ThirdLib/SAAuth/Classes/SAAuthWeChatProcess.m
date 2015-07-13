//
//  SAAuthWeChatProcess.m
//  Pods
//
//  Created by stonedong on 15/3/11.
//
//

#import "SAAuthWeChatProcess.h"
#import "WXApi.h"
#import "SAReqManager.h"

NSDictionary* MURequestJSONURL(NSString* url, NSError* __autoreleasing*error) {
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:error];
    if (*error) {
        return nil;
    }
    NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:error];
    if (*error) {
        return nil;
    }
    return dic;
}
@interface SAReqAuthProcess () <WXApiDelegate>


@end
@implementation SAAuthWeChatProcess

- (void) onReq:(BaseReq *)req
{
    
}

- (void) onResp:(BaseResp *)resp
{
    SendAuthResp* authResp = (SendAuthResp*)resp;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSString* url = [NSString stringWithFormat:@"https://api.weixin.qq.com/sns/oauth2/access_token?appid=%@&secret=%@&code=%@&grant_type=authorization_code",SAAuthShareManager.wechatAppId, SAAuthShareManager.wecahtScret, authResp.code];
        NSError* error;
        NSDictionary* dic = MURequestJSONURL(url, &error);
        if (error) {
            [self onRequestWeixinAuthError:error];
            return ;
        }
        SAToken* token = [SAToken new];
        token.openID = dic[@"openid"];
        token.token = dic[@"access_token"];
        
        NSMutableDictionary* infos = [dic mutableCopy];
        infos[@"code"] = authResp.code;
        token.userInfos = infos;
        
        
        NSString* infoURL = [NSString stringWithFormat:@"https://api.weixin.qq.com/sns/userinfo?access_token=%@&openid=%@", token.token, token.openID];
        
        NSDictionary* userInfos = MURequestJSONURL(infoURL, &error);
        if (error) {
            [self onRequestWeixinAuthError:error];
            return;
        }
        token.userAvaterURL = userInfos[@"headimgurl"];
        token.nickName = userInfos[@"nickname"];
        [infos addEntriesFromDictionary:userInfos];
        token.userInfos = infos;
        [self onReqeustWeixinAuthSucceed:token];
    });
}

- (void) onRequestWeixinAuthError:(NSError*)error
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if ([self.delegate respondsToSelector:@selector(authProcess:failtWithError:)]) {
            [self.delegate authProcess:self failtWithError:error];
        }
    });
}

- (void) onReqeustWeixinAuthSucceed:(SAToken*)token
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([self.delegate respondsToSelector:@selector(authProcess:succeedWithToken:)]) {
            [self.delegate authProcess:self succeedWithToken:token];
        }
    });
}

- (BOOL) handleOpenURL:(NSURL *)url
{
    [WXApi handleOpenURL:url delegate:self];
    return YES;
}
- (BOOL) canRequest:(NSError *__autoreleasing *)error
{
    if (![WXApi isWXAppInstalled]) {
        if (error != NULL) {
            *error = [NSError errorWithDomain:@"com.sa.auth" code:-111 userInfo:@{NSLocalizedDescriptionKey:@"未安装微信"}];
        }
    }
    return YES;
}

- (void) request
{
    SendAuthReq* req = [SendAuthReq new];
    req.scope = @"snsapi_userinfo";
    req.state = @"xxx";
    [WXApi sendReq:req];
}


@end


