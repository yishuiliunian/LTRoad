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
    
    [self addParamter:self.openID forKey:@"oAuthOpenId"];
    [self addParamter:self.accessToken forKey:@"oAuthAccessToken"];
    [self addParamter:LTTokenTypeKey(self.type) forKey:@"oAuthType"];
    return YES;
}
- (void) onSuccess:(id)retObject
{
    NSError* error;
    
    PMToken* token = [MTLJSONAdapter modelOfClass:[PMToken class] fromJSONDictionary:retObject error:&error];
    if (error) {
        [self doUIOnError:error];
        return;
    }

    [self doUIOnSuccced:token];
}
@end
