//
//  LTTokenReq.m
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTTokenReq.h"


NSString* LTTokenTypeKey(SATokenType type) {
    switch (type) {
        case SATokenQQ:
            return @"QQ";
            break;
        case SATokenWechat:
            return @"WeChat";
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
    [self addParamter:LTTokenTypeKey(self.type) forKey:@"OAuthType"];
    return YES;
}
@end
