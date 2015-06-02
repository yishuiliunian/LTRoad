//
//  LTUIClubMember.m
//  LuTu
//
//  Created by stonedong on 15/6/3.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTUIClubMember.h"
#import "LTGlobals.h"
@implementation LTUIClubMember

- (instancetype) initWithServerModel:(PMClubMember *)member
{
    self = [super init];
    if (!self) {
        return self;
    }
    _name = member.name;
    _avatarURL = STR_TO_URL(member.avatarUrl);
    _vihicleModel = member.vihicleModel;
    _type = member.memberType;
    return self;
}
@end
