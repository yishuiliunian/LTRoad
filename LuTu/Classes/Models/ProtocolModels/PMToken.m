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
             LTMantleSameMapPair(access_token),
             LTMantleSameMapPair(expiration),
             LTMantleSameMapPair(auth_first),
             LTMantleSameMapPair(auth_success),
             LTMantleSameMapPair(open_id),
             LTMantleSameMapPair(oauth_user_info),
             };
}
- (void) setNilValueForKey:(NSString *)key
{
    [self setValue:@0 forKey:key];
}
DEFINE_Mantle_JSONTranformer_Function(oauth_user_info, PMTokenUserInfo)

@end
