//
//  PMRouteDetail.h
//  LuTu
//
//  Created by stonedong on 15/5/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle.h>
#import <DZProgramDefines.h>
@interface PMRouteDetail : MTLModel <MTLJSONSerializing>
DEFINE_PROPERTY_STRONG_NSString(categoryList);
DEFINE_PROPERTY_STRONG_NSString(cityList);
DEFINE_PROPERTY_ASSIGN_INT64(createTime);
DEFINE_PROPERTY_STRONG_NSString(introImageUrl);
DEFINE_PROPERTY_STRONG_NSString(name);
DEFINE_PROPERTY_ASSIGN_INT64(routeId);
DEFINE_PROPERTY_ASSIGN_INT64(updateTime);
@end
