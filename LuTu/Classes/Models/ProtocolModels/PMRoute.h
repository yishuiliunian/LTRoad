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
#import "PMPoiInfo.h"

@interface PMRoutePropDetail : MTLModel <MTLJSONSerializing>
DEFINE_PROPERTY_STRONG_NSString(routeId);
DEFINE_PROPERTY_STRONG_NSString(propId);
DEFINE_PROPERTY_STRONG_NSString(detailId);
DEFINE_PROPERTY_STRONG_NSString(propName);
DEFINE_PROPERTY_STRONG_NSString(propDesc);
DEFINE_PROPERTY_STRONG_NSString(propValue);
@end


@interface PMRoute : MTLModel <MTLJSONSerializing>
DEFINE_PROPERTY_ASSIGN_BOOL(isFav);
DEFINE_PROPERTY_STRONG_NSString(name);
DEFINE_PROPERTY_STRONG_NSString(introImageUrl);
DEFINE_PROPERTY_ASSIGN_INT64(favCount);
@property (nonatomic, strong) NSArray* lines;
@property (nonatomic, strong) NSArray* routePropDetails;
@property (nonatomic, strong) NSArray* pois;
@end

