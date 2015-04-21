//
//  PMPoiInfo.h
//  LuTu
//
//  Created by stonedong on 15/4/21.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle.h>
typedef enum {
   PMPoiTypeHotel,
    PMPoiTypeSpot,
    PMPoiTypeGass
}PMPoiType;
@interface PMPoiInfo : MTLModel <MTLJSONSerializing>
@property (nonatomic, strong) NSString* routeID;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* intro_image_url;
@property (nonatomic, strong) NSString* intro_text;
@property (nonatomic, strong) NSString* arrival_time;
@property (nonatomic, assign) PMPoiType type;
@property (nonatomic, assign) int route_index;
@end
