//
//  PMCategory.m
//  LuTu
//
//  Created by stonedong on 15/4/26.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "PMCategory.h"
#import "LTGlobals.h"
@implementation PMCategory
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{
             LTMantleSameMapPair (categoryId),
             LTMantleSameMapPair(introImageUrl),
             LTMantleSameMapPair( name),
             LTMantleSameMapPair( routeCount),
             LTMantleSameMapPair( label)
             };
}
@end
