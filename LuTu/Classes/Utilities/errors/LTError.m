//
//  LTError.m
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTError.h"

NSString* errorMessageWithCode(int code) {
    switch (code) {
        case LTErrorCodeLostNetWork:
            return @"网络丢失!";
            break;
        case LTErrorCodeServerNotReturnData:
            return @"服务器跑路了，没有返回任何数据！";
            
        case LTErrorCodeDecode:
            return @"解析数据失败!";
        default:
            return @"未知错误!";
            break;
    }
}

@implementation NSError (LT)

+ (NSError*) ltErrorWithCode:(int)code
{
    NSString* message = errorMessageWithCode(code);
    return [self ltErrorWithCode:code message:message];
}

+ (NSError*) ltErrorWithCode:(int)code message:(NSString *)message
{
    if (!message) {
        message = @"未知错误!";
    }
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey:message};
    return [NSError errorWithDomain:@"com.xunluji.error" code:code userInfo:userInfo];
}

@end
