//
//  PMLine.m
//  LuTu
//
//  Created by stonedong on 15/4/21.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "PMLine.h"
#import "LTGlobals.h"
#import "PMLineSegment.h"

@implementation PMLine


+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{
             LTMantleSameMapPair(route_name),
             LTMantleSameMapPair(route_id),
             LTMantleSameMapPair(feature),
             LTMantleSameMapPair(duration),
             LTMantleSameMapPair(loaging),
             LTMantleSameMapPair(loaging_time),
             LTMantleSameMapPair(fee_loaging),
             LTMantleSameMapPair(fee_entrance),
             LTMantleSameMapPair(fee_food),
             LTMantleSameMapPair(gas_station),
             LTMantleSameMapPair(tags),
             LTMantleSameMapPair(lines),
             };
}

+ (NSValueTransformer*) tagsJSONTransformer {
    return [NSValueTransformer mtl_arrayMappingTransformerWithTransformer:[NSValueTransformer mtl_validatingTransformerForClass:[NSString class]]];
}

+ (NSValueTransformer*) linesJSONTransformer
{
    return [NSValueTransformer mtl_arrayMappingTransformerWithTransformer:[NSValueTransformer mtl_validatingTransformerForClass:[PMLineSegment class]]];
}

@end
