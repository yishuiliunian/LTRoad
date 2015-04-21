//
//  PMLinePoint.m
//  LuTu
//
//  Created by stonedong on 15/4/21.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "PMLinePoint.h"
#import "LTGlobals.h"
@implementation PMLinePoint
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{
             LTMantleSameMapPair(lat),
             LTMantleSameMapPair(lng)
             };
}
@end
