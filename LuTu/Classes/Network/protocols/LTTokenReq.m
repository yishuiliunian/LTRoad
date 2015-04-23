//
//  LTTokenReq.m
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTTokenReq.h"
#import "PMToken.h"
#import "MSToken.h"
#import "MSTokenManager.h"
NSString* LTTokenTypeKey(SATokenType type) {
    switch (type) {
        case SATokenQQ:
            return @"1";
            break;
        case SATokenWechat:
            return @"2";
            break;
    }
    return @"";
}

@implementation LTTokenReq

- (NSString*) method
{
    return @"/server/token/auth";
}

- (BOOL) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    
    [self addParamter:self.openID forKey:@"openId"];
    [self addParamter:self.accessToken forKey:@"accessToken"];
    [self addParamter:LTTokenTypeKey(self.type) forKey:@"oauthType"];
    return YES;
}
- (void) onSuccess:(id)retObject
{
    NSError* error;
    PMToken* token = [[PMToken alloc] initWithDictionary:retObject error:&error];
    if (error) {
        [self doUIOnError:error];
        return;
    }
    MSToken* serverToken = [[MSToken alloc] initWithToken:token.access_token account:_openID];
    serverToken.experiedDate = [NSDate dateWithTimeIntervalSince1970:token.expiration/1000];
    [self doUIOnSuccced:serverToken];
}
@end
