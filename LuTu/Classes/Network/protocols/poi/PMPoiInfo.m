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
      LTMantleSameMapPair(route_index),
        LTMantleSameMapPair(arrival_time),
        LTMantleSameMapPair(type),
        LTMantleSameMapPair(intro_text),
        LTMantleSameMapPair(name),
        LTMantleSameMapPair(intro_image_url)
    };
}
@end
