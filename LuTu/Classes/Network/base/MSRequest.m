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

- (void) addParamter:(id)paramter forKey:(NSString*)key
{
    if (!paramter || !key) {
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
- (BOOL) doRequst
{
    NSError* error= nil;
    [self addCommonParamters:&error];
    MSRequestOnErrorAndReturn(error);
    [self loadParamters:&error];
    MSRequestOnErrorAndReturn(error);
    
    NSString* baseURL = MSDefaultServerURL;
    NSString* urlStr = [baseURL stringByAppendingPathComponent:self.method] ;
    NSURL* url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:HttpMethodPOST];
    
    NSString* paramterstr = [self requestParamtersAppendingURL];
    NSData* paramData = [paramterstr dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:paramData];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:[@([paramData length]) stringValue] forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"*/*" forHTTPHeaderField:@"Accept"];
   
    NSURLResponse* response ;
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    MSRequestOnErrorAndReturn(error);
    if (!data || data.length == 0) {
        NSError* error = [NSError ltErrorWithCode:LTErrorCodeServerNotReturnData];
        MSRequestOnErrorAndReturn(error);
    }
    NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];

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
    id retData = dic[@"data"];
    [self onSuccess:retData];
    return YES;
}

- (void) doUIOnSuccced:(id)object
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([self.uidelegate respondsToSelector:@selector(request:onSucced:)]) {
            [self.uidelegate request:self onSucced:object];
        }
    });
}

- (void) doUIOnError:(NSError*)error
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([self.uidelegate respondsToSelector:@selector(request:onError:)]) {
            [self.uidelegate request:self onError:error];
        }
    });
}
@end
