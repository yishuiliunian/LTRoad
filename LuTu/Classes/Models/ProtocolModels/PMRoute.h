//
//  PMRoute.h
//  LuTu
//
//  Created by stonedong on 15/4/21.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MTLModel.h"
#import <DZProgramDefines.h>
#import <Mantle.h>
#import "PMLine.h"
@interface PMRoute : MTLModel <MTLJSONSerializing>
DEFINE_PROPERTY_STRONG_NSString(route_name);
DEFINE_PROPERTY_STRONG_NSString(applicable_vehicle);
DEFINE_PROPERTY_STRONG_NSString(summary);
DEFINE_PROPERTY_STRONG_NSString(feature);
DEFINE_PROPERTY_STRONG_NSString(duration);
DEFINE_PROPERTY_STRONG_NSString(lodging);
DEFINE_PROPERTY_STRONG_NSString(lodging_time);
DEFINE_PROPERTY_STRONG_NSString(gas_station);
DEFINE_PROPERTY_STRONG_NSString(tag);
@property (nonatomic, strong) NSArray* lines;
@end

