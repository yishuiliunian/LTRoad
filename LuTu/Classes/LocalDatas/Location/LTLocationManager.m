//
//  LTLocationManager.m
//  LuTu
//
//  Created by stonedong on 15/4/26.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTLocationManager.h"
#import <DZSingletonFactory.h>
@implementation LTLocationManager
+ (LTLocationManager*) shareManager
{
    return DZSingleForClass([self class]);
}
@end
