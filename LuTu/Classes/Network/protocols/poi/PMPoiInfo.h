//
//  PMPoiInfo.h
//  LuTu
//
//  Created by stonedong on 15/4/21.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle.h>
#import <DZProgramDefines.h>
#import "PMLinePoint.h"
typedef enum {
   PMPoiTypeHotel,
    PMPoiTypeSpot,
    PMPoiTypeGass
}PMPoiType;
@interface PMPoiInfo : MTLModel <MTLJSONSerializing>
DEFINE_PROPERTY_STRONG_NSString(poiId);
DEFINE_PROPERTY_STRONG_NSString(routeId);
DEFINE_PROPERTY_STRONG_NSString(name);
DEFINE_PROPERTY_ASSIGN(PMPoiType, type);
DEFINE_PROPERTY_ASSIGN_BOOL(cover);
DEFINE_PROPERTY_STRONG_NSString(routeIndex);
DEFINE_PROPERTY_STRONG_NSString(location);
DEFINE_PROPERTY_STRONG_NSString(introImageUrl);
DEFINE_PROPERTY_STRONG_NSString(introText);
DEFINE_PROPERTY_ASSIGN_INT64(arrivalTime);
@end
