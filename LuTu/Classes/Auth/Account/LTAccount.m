//
//  LTAccount.m
//  MoShang
//
//  Created by stonedong on 15/2/7.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import "LTAccount.h"
#import "LTGlobals.h"

@implementation LTAccount
+ (NSDictionary*) JSONKeyPathsByPropertyKey
{
    return @{
             LTMantleSameMapPair(accountID),
             LTMantleSameMapPair(openId),
             LTMantleSameMapPair(openAccessToken),
             LTMantleSameMapPair(userInfo)
             };
}

+ (NSValueTransformer*) userInfoJSONTransformer
{
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[LTUserInfo class]];
}
@end
