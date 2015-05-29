//
//  LTGetRouteCommentReq.m
//  LuTu
//
//  Created by stonedong on 15/5/28.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTGetRouteCommentReq.h"

@implementation LTGetRouteCommentReq
- (NSString*) method
{
    return @"/route/getRouteComment";
}

- (BOOL) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    [self addParamterNumber:@(self.pageNo) forKey:@"pageNo"];
    [self addParamterNumber:@(self.pageSize) forKey:@"pageSize"];
    [self addParamter:self.routeId forKey:@"routeId"];
    return self;
}

- (void) onSuccess:(id)retObject
{
    
}
@end
