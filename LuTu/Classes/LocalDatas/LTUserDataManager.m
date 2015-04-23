//
//  LTUserDataManager.m
//  LuTu
//
//  Created by stonedong on 15/4/23.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTUserDataManager.h"
#import <DZSingletonFactory.h>
@implementation LTUserDataManager

+ (LTUserDataManager*) shareInstance
{
    return DZSingleForClass([self class]);
}

@end
