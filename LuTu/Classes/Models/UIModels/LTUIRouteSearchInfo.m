//
//  LTUIRouteSearchInfo.m
//  LuTu
//
//  Created by stonedong on 15/6/7.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTUIRouteSearchInfo.h"

@implementation LTUIRouteSearchInfo

- (instancetype) initWithRouteInfo:(PMRouteSearchInfo *)info
{
    self = [super init];
    if (!self) {
        return self;
    }
    _introImageURL = [NSURL URLWithString:info.introImageUrl];
    _title = info.name;
    _timeText = @"2011/1/1";
    _routeId = info.routeId;
    return self;
}

- (instancetype) initWithFavoriteInfo:(PMFavoriteInfo *)info
{
    self = [super init];
    if (!self) {
        return self;
    }
    _introImageURL = [NSURL URLWithString:info.introImageUrl];
    _title = info.name;
    _timeText = @"2011/11/1";
    _routeId = info.routeId;
    return self;
}
@end
