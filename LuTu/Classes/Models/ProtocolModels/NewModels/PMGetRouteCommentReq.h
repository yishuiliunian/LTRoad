//
//  PMGetRouteCommentReq.h
//  LuTu
//
//  Created by stonedong on 15/5/28.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Metal/Metal.h>
#import <DZProgramDefines.h>
#import <Mantle.h>
@interface PMGetRouteCommentReq : MTLArgument <MTLJSONSerializing>
DEFINE_PROPERTY_ASSIGN_INT64(limit);
DEFINE_PROPERTY_ASSIGN_INT64(total);
DEFINE_PROPERTY_STRONG(NSArray*, list);
@end
