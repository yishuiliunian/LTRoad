//
//  LTCityReq.m
//  LuTu
//
//  Created by stonedong on 15/5/12.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTCityReq.h"
#import "PMCity.h"
@implementation LTCityReq
- (NSString*) method
{
    return @"/city/list";
}

- (void) onSuccess:(id)retObject
{
    NSArray* citys = retObject[@"cities"];
    NSError* error = nil;
    NSArray* pmCitys = [MTLJSONAdapter modelsOfClass:[PMCity class] fromJSONArray:citys error:&error];
    if (error) {
        [self onError:error];
        return;
    }
    [self doUIOnSuccced:pmCitys];
}


@end
