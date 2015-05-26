//
//  PMLineSegment.m
//  LuTu
//
//  Created by stonedong on 15/5/25.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "PMLineSegment.h"
#import "LTGlobals.h"
@implementation PMLineSegment
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{
             LTMantleSameMapPair(distance),
             LTMantleSameMapPair(fee_gas),
             LTMantleSameMapPair(feed_pass),
             LTMantleSameMapPair(route_index),
             LTMantleSameMapPair(location_start),
             LTMantleSameMapPair(location_end)
             };
}

DEFINE_Mantle_JSONTranformer_Function(location_end, PMLinePoint)
DEFINE_Mantle_JSONTranformer_Function(location_start, PMLinePoint)
@end
