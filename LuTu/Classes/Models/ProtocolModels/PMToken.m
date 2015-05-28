//
//  PMToken.m
//  LuTu
//
//  Created by stonedong on 15/4/23.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "PMToken.h"
#import "LTGlobals.h"

@implementation PMTokenUserInfo

+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{
             LTMantleSameMapPair(nick_name),
             LTMantleSameMapPair(avatar_url)
             };
}

@end

@implementation PMToken

+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{
             LTMantleSameMapPair(avatarUrl),
             LTMantleSameMapPair(city),
             LTMantleSameMapPair(createTime),
             LTMantleSameMapPair(drivingYear),
             LTMantleSameMapPair(name),
             LTMantleSameMapPair(oauthType),
             LTMantleSameMapPair(phone),
             LTMantleSameMapPair(status),
             LTMantleSameMapPair(updateTime),
             LTMantleSameMapPair(userId),
             LTMantleSameMapPair(vehicleModel),
             };
}
- (void) setNilValueForKey:(NSString *)key
{
    [self setValue:@0 forKey:key];
}

@end
