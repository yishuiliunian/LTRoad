//
//  PMRoute.m
//  LuTu
//
//  Created by stonedong on 15/4/21.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "PMRoute.h"
#import <Mantle.h>
@implementation PMRoute
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{
             @"route_name":@"route_name",
             @"applicable_vehicle":@"applicable_vehicle",
             @"summary":@"summary",
             @"feature":@"feature",
             @"duration":@"duration",
             @"lodging":@"lodging",
             @"lodging_time":@"lodging_time",
             @"gas_station":@"gas_station",
             @"tag":@"tag",
             @"lines":@"lines",
             };
}
+ (NSValueTransformer*) linesJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[PMLine class]];
}
@end


