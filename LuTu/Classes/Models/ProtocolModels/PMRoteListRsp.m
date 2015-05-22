//
//  PMRoteListRsp.m
//  LuTu
//
//  Created by stonedong on 15/5/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "PMRoteListRsp.h"
#import "LTGlobals.h"
#import "PMRouteDetail.h"
@implementation PMRoteListRsp

+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{
             LTMantleSameMapPair(limit),
             LTMantleSameMapPair(count),
             LTMantleSameMapPair(offset),
             LTMantleSameMapPair(total),
             LTMantleSameMapPair(list)
             };
}


DEFINE_Mantle_JSONTranformer_Function(routeDetail, PMRouteDetail);

+ (NSValueTransformer*)  listJSONTransformer
{
    return [NSValueTransformer mtl_arrayMappingTransformerWithTransformer:[self routeDetailJSONTransformer]];
}

@end
