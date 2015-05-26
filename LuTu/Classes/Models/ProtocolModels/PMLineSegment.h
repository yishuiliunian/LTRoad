//
//  PMLineSegment.h
//  LuTu
//
//  Created by stonedong on 15/5/25.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MTLModel.h"
#import <DZProgramDefines.h>
#import <Mantle.h>
#import "PMLinePoint.h"
@interface PMLineSegment : MTLModel <MTLJSONSerializing>
DEFINE_PROPERTY_ASSIGN_Float(distance);
DEFINE_PROPERTY_ASSIGN_Float(fee_gas);
DEFINE_PROPERTY_ASSIGN_Float(feed_pass);
DEFINE_PROPERTY_ASSIGN_INT64(route_index);
@property (nonatomic, strong) PMLinePoint* location_start;
@property (nonatomic, strong) PMLinePoint* location_end;
@end
