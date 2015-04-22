//
//  LTUserInfoItem.m
//  LuTu
//
//  Created by stonedong on 15/4/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTUserInfoItem.h"

@implementation LTUserInfoItem
- (instancetype) initWithName:(NSString *)name detail:(NSString *)detail
{
    self = [super init];
    if (!self) {
        return self;
    }
    _name = name;
    _detail = detail;
    return self;
}
@end
