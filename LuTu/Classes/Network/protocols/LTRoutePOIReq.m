//
//  LTRoutePOIReq.m
//  LuTu
//
//  Created by stonedong on 15/4/21.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTRoutePOIReq.h"
#import "PMPoiInfo.h"
#import "LTUIPoi.h"
@implementation LTRoutePOIReq
- (NSString*) method
{
    return @"/route/poi/list";
}

- (BOOL) loadParamters:(NSError *__autoreleasing *)error
{
    SendSuperFunctionWithError(loadParamters);
    [self addParamter:self.routeID forKey:@"routeId"];
    return YES;
}

- (void) onSuccess:(id)retObject
{
    NSArray* array = (NSArray*)retObject;
    NSError* error;
    NSArray*pois = [MTLJSONAdapter modelsOfClass:[PMPoiInfo class] fromJSONArray:array error:&error];
    if (error) {
        [self doUIOnError:error];
        return;
    }
    NSMutableArray* uipois = [NSMutableArray new];
    for (PMPoiInfo* info in pois) {
        LTUIPoi* p = [[LTUIPoi alloc] initWithPOI:info];
        [uipois addObject:p];
    }
    
    [self doUIOnSuccced:uipois];
}
@end
