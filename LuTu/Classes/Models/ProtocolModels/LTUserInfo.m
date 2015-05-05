//
//  LTUserInfo.m
//  LuTu
//
//  Created by stonedong on 15/5/5.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTUserInfo.h"
#import "LTGlobals.h"
@implementation LTUserInfo

+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{
             LTMantleSameMapPair(nickName),
             LTMantleSameMapPair(avatarURL),
             LTMantleSameMapPair(birthDay)
             };
}
- (instancetype) initWithPMTokenUserInfo:(PMTokenUserInfo*)pUserInfo
{
    self = [self init];
    if (!self) {
        return self;
    }
    
    _nickName = pUserInfo.nick_name;
    _avatarURL = pUserInfo.avatar_url;
    return self;
}
- (void) setNilValueForKey:(NSString *)key
{
    [self setValue:@"" forKey:key];
}

@end
