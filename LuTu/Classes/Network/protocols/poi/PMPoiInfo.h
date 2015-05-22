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
typedef enum {
   PMPoiTypeHotel,
    PMPoiTypeSpot,
    PMPoiTypeGass
}PMPoiType;
@interface PMPoiInfo : MTLModel <MTLJSONSerializing>
DEFINE_PROPERTY_ASSIGN_INT64(routeId);
DEFINE_PROPERTY_ASSIGN_INT64(poiId);
DEFINE_PROPERTY_ASSIGN_INT64(routeIndex);
@property (nonatomic, assign) BOOL cover;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* introImageUrl;
@property (nonatomic, strong) NSString* introText;
DEFINE_PROPERTY_ASSIGN_INT64(arrivalTime);
@property (nonatomic, strong) NSString* location;
@property (nonatomic, assign) PMPoiType type;
@end
