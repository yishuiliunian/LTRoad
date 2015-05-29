//
//  PMRecommondLine.m
//  LuTu
//
//  Created by stonedong on 15/4/20.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "PMRecommondLine.h"
#import <Mantle.h>
#import "LTGlobals.h"

@implementation PMRecommondLine

+ (NSDictionary*)JSONKeyPathsByPropertyKey
{
    return @{
             LTMantleMapPair(category, category),
             LTMantleMapPair(fav_count, fav_count),
             LTMantleMapPair(notice_poi, notice_poi),
             LTMantleMapPair(route_id, route_id),
             LTMantleMapPair(route_name, route_name),
             LTMantleSameMapPair(tag),
             LTMantleSameMapPair(intro_image_url)
             };
}
+ (NSValueTransformer*) notice_poiJSONTransformer
{
    return [NSValueTransformer mtl_validatingTransformerForClass:[PMNoticePOI class]];
}
@end
