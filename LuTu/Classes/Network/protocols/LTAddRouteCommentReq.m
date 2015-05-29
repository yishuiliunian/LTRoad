//
//  LTAddRouteCommentReq.m
//  LuTu
//
//  Created by stonedong on 15/5/28.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTAddRouteCommentReq.h"

@implementation LTAddRouteCommentReq

- (NSString*) method
{
    return @"/route/addRouteComment";
}

- (BOOL) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    [self addParamter:self.content forKey:@"content"];
    [self addParamter:self.creatorId forKey:@"creatorId"];
    [self addParamter:self.routeId forKey:@"routeId"];
    return YES;
}

- (void) onSuccess:(id)retObject
{
    [self doUIOnSuccced:nil];
}

@end
