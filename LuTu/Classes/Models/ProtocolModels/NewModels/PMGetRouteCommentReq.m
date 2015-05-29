//
//  PMGetRouteCommentReq.m
//  LuTu
//
//  Created by stonedong on 15/5/28.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "PMGetRouteCommentReq.h"
#import "LTGlobals.h"
@implementation PMGetRouteCommentReq
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{
             LTMantleSameMapPair(limit),
             LTMantleSameMapPair(total),
             LTMantleSameMapPair(list)
             };
}

@end
