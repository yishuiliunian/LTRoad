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

- (instancetype) initWithSearchInfo:(PMClubSearchInfo *)info
{
    self = [super init];
    if (!self) {
        return self;
    }
    _clubID = info.carClubId;
    _title = info.name;
    _detail = [NSString stringWithFormat:@"%d个会员,%d个话题", info.memberCount, info.threadCount];
    _emblemURL = STR_TO_URL(info.introImageUrl);
    return self;
}

- (instancetype) initWithClubInfo:(PMUserClubInfo *)info
{
    self = [super init];
    if (!self) {
        return self;
    }
    _clubID = info.carClubId;
    _title = info.name;
    _detail = info.introText;
    _emblemURL = STR_TO_URL(info.introImageUrl);
    return self;
}
@end
