//
//  PMLinePoint.h
//  LuTu
//
//  Created by stonedong on 15/4/21.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MTLModel.h"
#import <DZSingletonFactory.h>
#import <DZProgramDefines.h>
#import <Mantle.h>

FOUNDATION_EXTERN NSValueTransformer* PMLinePointJSONTransformer();
@interface PMLinePoint : MTLModel <MTLJSONSerializing>
+ (PMLinePoint*) defaultPoint;
@property (nonatomic, assign) double lat;
@property (nonatomic, assign) double lng;
@end


