//
//  LTUICarMeet.m
//  LuTu
//
//  Created by stonedong on 15/4/13.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTUICarMeet.h"
#import "LTGlobals.h"
@implementation LTUICarMeet

- (instancetype) initWithSimpleInfo:(PMUserCarClubSimpleInfo *)info
{
    self = [super init];
    if (!self) {
        return self;
    }
    _clubID = info.carClubId;
    _key = info.carClubId;
    _emblemURL = STR_TO_URL(info.introImageUrl);
    _title = info.name;
    _detail = info.introText;
    return self;
}
@end
