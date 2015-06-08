//
//  LTUIMyNew.m
//  LuTu
//
//  Created by stonedong on 15/6/8.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTUIMyNew.h"

@implementation LTUIMyNew
- (instancetype) initWithPMNews:(PMUserNewsInfo *)info
{
    self = [super init];
    if (!self) {
        return self;
    }
    _dynamicId = info.userId;
    _content = info.content;
    _timeText = @"2012/1/1";
    return self;
}
@end
