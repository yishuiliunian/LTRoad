//
//  LTRouteDetailReq.m
//  LuTu
//
//  Created by stonedong on 15/4/21.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTRouteDetailReq.h"
#import "PMRoute.h"
#import <Mantle.h>
@implementation LTRouteDetailReq
- (NSString*) method
{
    return @"/route/detail";
}

- (BOOL) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    [self addParamter:self.routeID forKey:@"routeId"];
    return YES;
}

- (void) onSuccess:(id)retObject
{
    
    NSError* error = nil;
    PMRoute* route = [MTLJSONAdapter modelOfClass:[PMRoute class] fromJSONDictionary:retObject error:&error];

    if (error) {
        [self doUIOnError:error];
        return;
    }
    
    [self doUIOnSuccced:route];
    
}
@end
