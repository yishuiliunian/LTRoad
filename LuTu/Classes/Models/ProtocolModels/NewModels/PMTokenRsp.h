//
//  PMTokenRsp.h
//  LuTu
//
//  Created by stonedong on 15/5/25.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle.h>
#import <DZGeometryTools.h>
#import <DZProgramDefines.h>
@interface PMTokenRsp : MTLModel <MTLJSONSerializing>
DEFINE_PROPERTY_STRONG_NSString(city);
DEFINE_PROPERTY_STRONG_NSString(createTime);
DEFINE_PROPERTY_STRONG_NSString(drivingYear);
DEFINE_PROPERTY_STRONG_NSString(phone);
DEFINE_PROPERTY_STRONG_NSString(name);
DEFINE_PROPERTY_STRONG_NSString(updateTime);
DEFINE_PROPERTY_STRONG_NSString(vehicleModel);
DEFINE_PROPERTY_STRONG_NSString(avatarUrl);
DEFINE_PROPERTY_ASSIGN_INT16(status);
DEFINE_PROPERTY_STRONG_NSString(userId);

@end
