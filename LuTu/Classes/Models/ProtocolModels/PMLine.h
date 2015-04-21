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
DEFINE_PROPERTY_ASSIGN_Float(fee_gas);
DEFINE_PROPERTY_ASSIGN_Float(fee_pass);
DEFINE_PROPERTY_ASSIGN_Float(distance);
@property (nonatomic, assign) NSInteger route_index;
@property (nonatomic, strong) PMLinePoint* location_start;
@property (nonatomic, strong) PMLinePoint* location_end;
@end


