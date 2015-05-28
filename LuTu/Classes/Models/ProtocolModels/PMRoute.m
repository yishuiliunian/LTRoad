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


#define __DEFINE_Mantle_JSONTranformer_Function_Array( name ,c,sub) \
+ (NSValueTransformer*) name##sub {\
    return [NSValueTransformer mtl_arrayMappingTransformerWithTransformer:[NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[c class]]];\
}
#define DEFINE_Mantle_Array_JSONTranformer_Function( name ,c) __DEFINE_Mantle_JSONTranformer_Function_Array( name ,c, JSONTransformer)

DEFINE_Mantle_Array_JSONTranformer_Function(pois, PMPoiInfo);
DEFINE_Mantle_Array_JSONTranformer_Function(lines, PMLineSegment);
DEFINE_Mantle_Array_JSONTranformer_Function(routePropDetails, PMRoutePropDetail)

@end


