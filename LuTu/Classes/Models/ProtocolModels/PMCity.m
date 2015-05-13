//
//  PMCity.m
//  LuTu
//
//  Created by stonedong on 15/5/12.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "PMCity.h"
#import "LTGlobals.h"
@implementation PMCity
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{LTMantleSameMapPair(name),
             LTMantleMapPair(cityID, id)};
}

@end
