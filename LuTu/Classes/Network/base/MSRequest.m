//
//  MSRequest.m
//  MoShang
//
//  Created by stonedong on 15/2/4.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "MSRequest.h"
#import "MSRouter.h"
#import "LTError.h"
#import <NSString+URLEncode.h>
#import "MSLog.h"
#import "MUAlertPool.h"
#import "MSTokenManager.h"
#import "LTAccountManager.h"
@interface MSRequest ()

@end
@implementation MSRequest
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _paramters = [NSMutableDictionary new];
    return self;
}

- (NSDictionary*)allParamters
{
    return [_paramters copy];
}
- (void) addParamterNumber:(NSNumber*)paramter forKey:(NSString *)key
{
    [self addParamter:[paramter stringValue] forKey:key];
}
- (void) addParamterArray:(NSArray*)paramter subKey:(NSString*)subKey forKey:(NSString *)key
{
    if (!key) {
        return;
    }
    if (!subKey) {
        return;
    }
    for (int i = 0 ; i < paramter.count; i++) {
        id value = paramter[i];
        NSString* pKey = [NSString stringWithFormat:@"%@[%d].%@",key,i,subKey];
        [self addParamter:value forKey:pKey];
    }
}
- (void) addParamter:(id)paramter forKey:(NSString*)key
{
    if (!key) {
        return;
    }
    if (!paramter) {
        return;
    }
    if ([paramter isKindOfClass:[NSString class]]) {
        paramter = [(NSString*)paramter URLEncode];
    }
    _paramters[key] = paramter;
}
- (BOOL) addCommonParamters:(NSError *__autoreleasing *)error {
    [self addParamter:@"1.0.1" forKey:@"clientversion"];
    [self addParamter:@"ios" forKey:@"platform"];
    return YES;
}

- (BOOL) loadParamters:(NSError *__autoreleasing *)error
{
    return YES;
}
- (void) onError:(NSError*)error {
    [self doUIOnError:error];
}

- (void) onSuccess:(id)retObject {
    
}

- (NSString*) requestParamtersAppendingURL
{
    NSMutableString* str = [NSMutableString new];
    NSArray* allKeys = [_paramters allKeys];
    for (int i = 0 ; i < allKeys.count; i++) {
        if (i != 0) {
            [str appendString:@"&"];
        }
        [str appendFormat:@"%@=%@", allKeys[i], _paramters[allKeys[i]]];
    }
    return str;
}

- (void) willSendRequest:(NSMutableURLRequest*)request
{
}
- (BOOL) doRequst
{
    NSError* error= nil;
    [self addCommonParamters:&error];
    MSRequestOnErrorAndReturn(error);
    [self loadParamters:&error];
    MSRequestOnErrorAndReturn(error);
    
    NSURL* url = MSDefaultServerURL;
    NSString* method = self.method;
    NSParameterAssert(method);
    
    NSString* paramterstr = [self requestParamtersAppendingURL];
    NSString* urlStr = [NSString stringWithFormat:@"%@%@?%@", url.absoluteString,method,  paramterstr];

    url = [NSURL URLWithString:urlStr];


    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:HttpMethodGET];
    [self willSendRequest:request];

    //
    DDLogInfo(@"发送的请求详情:%@",request);
    //
    NSURLResponse* response ;
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    MSRequestOnErrorAndReturn(error);
    if (!data || data.length == 0) {
        NSError* error = [NSError ltErrorWithCode:LTErrorCodeServerNotReturnData];
        MSRequestOnErrorAndReturn(error);
    }
    NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
#ifdef DEBUG
    NSString* str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"服务器返回的数据是:%@",str);
#endif
    MSRequestOnErrorAndReturn(error);
    if (![dic isKindOfClass:[NSDictionary class]]) {
        error = [NSError ltErrorWithCode:LTErrorCodeDecode];
        MSRequestOnErrorAndReturn(error);
    }
    int ret = [dic[@"status"] intValue];
    if (ret != 0) {
        NSString* message = dic[@"message"];
        error = [NSError ltErrorWithCode:ret message:message];
        MSRequestOnErrorAndReturn(error);
    }
    NSMutableDictionary* resultMaps = [NSMutableDictionary new];
    id retData = dic[@"result"];
    if ([retData isKindOfClass:[NSArray class]]) {
        [self onSuccess:retData];
    } else if([retData isKindOfClass:[NSDictionary class]])
    {
        [self onSuccess:retData];
    } else
    {
        [self onSuccess:dic];
    }
    return YES;
}

- (void) doUIOnSuccced:(id)object
{
    dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        MUAlertHideLoading;
        });
        if ([self.uidelegate respondsToSelector:@selector(request:onSucced:)]) {
            [self.uidelegate request:self onSucced:object];
        }
    });
}

- (void) doUIOnError:(NSError*)error
{
    dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        MUAlertHideLoading;
        });
        if ([self.uidelegate respondsToSelector:@selector(request:onError:)]) {
            [self.uidelegate request:self onError:error];
        }
    });
}
@end
