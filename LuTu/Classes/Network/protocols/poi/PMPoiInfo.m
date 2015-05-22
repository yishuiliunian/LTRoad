//
//  PMPoiInfo.m
//  LuTu
//
//  Created by stonedong on 15/4/21.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "PMPoiInfo.h"
#import "LTGlobals.h"
@implementation PMPoiInfo
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @ {
      LTMantleSameMapPair(routeId),
        LTMantleSameMapPair(poiId),
        LTMantleSameMapPair(routeIndex),
        LTMantleSameMapPair(cover),
        LTMantleSameMapPair(name),
        LTMantleSameMapPair(introImageUrl),
        LTMantleSameMapPair(introText),
        LTMantleSameMapPair(arrivalTime),
        LTMantleSameMapPair(location),
        LTMantleSameMapPair(type)
    };
}
@end
