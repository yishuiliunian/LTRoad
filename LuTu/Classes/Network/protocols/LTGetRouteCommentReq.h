//
//  LTGetRouteCommentReq.h
//  LuTu
//
//  Created by stonedong on 15/5/28.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MSRequest.h"
#import <DZProgramDefines.h>
@interface LTGetRouteCommentReq : MSRequest
DEFINE_PROPERTY_ASSIGN_INT64(pageNo);
DEFINE_PROPERTY_ASSIGN_INT64(pageSize);
DEFINE_PROPERTY_STRONG_NSString(routeId);
@end
