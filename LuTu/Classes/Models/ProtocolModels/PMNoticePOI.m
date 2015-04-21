//
//  PMNoticePOI.m
//  LuTu
//
//  Created by stonedong on 15/4/21.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "PMNoticePOI.h"
#import "LTGlobals.h"
@implementation PMNoticePOI
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @ {
        LTMantleSameMapPair(arrival_time),
        LTMantleSameMapPair(intro_image_url),
        LTMantleSameMapPair(location)
    };
}

+ (NSValueTransformer*) locationJSONTransformer
{
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[PMLinePoint class]];
}
@end
