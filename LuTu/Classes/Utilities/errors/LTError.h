//
//  LTError.h
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    LTErrorCodeLostNetWork = -9000,
    LTErrorCodeServerNotReturnData = -9001
}LTErrorCodeNetwork;


typedef enum {
    LTErrorCodeEncode = -7000,
    LTErrorCodeDecode = -7001
}LTErrorCodeProtocol;


@interface NSError (LT)
+ (NSError*) ltErrorWithCode:(int)code;
+ (NSError*) ltErrorWithCode:(int)code message:(NSString*)message;
@end

