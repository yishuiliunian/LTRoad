//
//  PMLine.m
//  LuTu
//
//  Created by stonedong on 15/4/21.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "PMLine.h"
#import "LTGlobals.h"

@implementation PMLine


+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{
             @"fee_gas":@"fee_gas",
             @"fee_pass":@"fee_pass",
             @"distance":@"distance",
             @"route_index":@"route_index",
             @"location_end":@"location_end",
             @"location_start":@"location_start",
             
             };
}


DEFINE_Mantle_JSONTranformer_Function(location_start, PMLinePoint)
DEFINE_Mantle_JSONTranformer_Function(location_end, PMLinePoint)
@end
