//
//  LTUIMyCarClubInfo.m
//  LuTu
//
//  Created by stonedong on 15/5/5.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTUIMyCarClubInfo.h"

@implementation LTUIMyCarClubInfo
- (instancetype) initWithPMUserCarClubInfo:(PMUserCarClub *)info
{
    self = [super init];
    if (!self) {
        return self;
    }
    _club_id = info.club_id;
    _name = info.name;
    _detailInfo = [NSString stringWithFormat:@"%d个会员，%@个话题", info.member_count, info.thread_count];
    _avatarImageUrl = [NSURL URLWithString:info.intro_image_url];
    return self;
}
@end
