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
             LTMantleSameMapPair(category_id),
             LTMantleSameMapPair(intro_image_url),
             LTMantleSameMapPair(name)
             };
}
@end
