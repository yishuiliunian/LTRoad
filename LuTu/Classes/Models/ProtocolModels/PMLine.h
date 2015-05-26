//
//  PMLine.h
//  LuTu
//
//  Created by stonedong on 15/4/21.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MTLModel.h"
#import <DZSingletonFactory.h>
#import <Mantle.h>
#import <DZProgramDefines.h>
#import "PMLinePoint.h"
@interface PMLine : MTLModel <MTLJSONSerializing>
DEFINE_PROPERTY_STRONG_NSString(route_name);
DEFINE_PROPERTY_STRONG_NSString(route_id);
DEFINE_PROPERTY_STRONG_NSString(feature);
DEFINE_PROPERTY_STRONG_NSString(duration);
DEFINE_PROPERTY_STRONG_NSString(loaging);
DEFINE_PROPERTY_STRONG_NSString(loaging_time);
DEFINE_PROPERTY_ASSIGN_Float(fee_loaging);
DEFINE_PROPERTY_ASSIGN_Float(fee_entrance);
DEFINE_PROPERTY_ASSIGN_Float(fee_food);
DEFINE_PROPERTY_ASSIGN_Float(gas_station);
@property (nonatomic, strong) NSArray* tags;
@property (nonatomic, strong) NSArray* lines;
@end


