//
//  PMRoute.m
//  LuTu
//
//  Created by stonedong on 15/4/21.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "PMRoute.h"
#import <Mantle.h>
#import "PMLineSegment.h"
#import "LTGlobals.h"


@implementation PMRoutePropDetail

+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{
             LTMantleSameMapPair(routeId),
             LTMantleSameMapPair(propId),
             LTMantleSameMapPair(detailId),
             LTMantleSameMapPair(propName),
             LTMantleSameMapPair(propDesc),
             LTMantleSameMapPair(propValue),
             };
}

@end
@implementation PMRoute
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{
             LTMantleSameMapPair(isFav),
             LTMantleSameMapPair(name),
             LTMantleSameMapPair(introImageUrl),
             LTMantleSameMapPair(favCount),
             LTMantleSameMapPair(lines),
             LTMantleSameMapPair(routePropDetails),
             LTMantleSameMapPair(pois)
             };
    
}




DEFINE_Mantle_Array_JSONTranformer_Function(pois, PMPoiInfo);
DEFINE_Mantle_Array_JSONTranformer_Function(lines, PMLineSegment);
DEFINE_Mantle_Array_JSONTranformer_Function(routePropDetails, PMRoutePropDetail)

@end


