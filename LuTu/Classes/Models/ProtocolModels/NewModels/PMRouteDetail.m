//
//  PMRouteDetail.m
//  LuTu
//
//  Created by stonedong on 15/5/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "PMRouteDetail.h"
#import "LTGlobals.h"
@implementation PMRouteDetail
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{
             LTMantleSameMapPair(categoryList),
             LTMantleSameMapPair(cityList),
             LTMantleSameMapPair(createTime),
             LTMantleSameMapPair(introImageUrl),
             LTMantleSameMapPair(name),
             LTMantleSameMapPair(routeId),
             LTMantleSameMapPair(updateTime),
             };
}




@end
