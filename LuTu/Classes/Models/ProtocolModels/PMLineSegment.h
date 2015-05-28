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
DEFINE_PROPERTY_STRONG_NSString(distance);
DEFINE_PROPERTY_STRONG_NSString(lineId);
DEFINE_PROPERTY_STRONG_NSString(name);
DEFINE_PROPERTY_STRONG_NSString(routeId);
DEFINE_PROPERTY_STRONG_NSString(routeIndex);
@property (nonatomic, strong) PMLinePoint* locationStart;
@property (nonatomic, strong) PMLinePoint* locationEnd;
@end
