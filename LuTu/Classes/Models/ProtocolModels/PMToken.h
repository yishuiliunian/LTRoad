//
//  PMToken.h
//  LuTu
//
//  Created by stonedong on 15/4/23.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle.h>
#import <DZProgramDefines.h>
@interface PMTokenUserInfo : MTLModel <MTLJSONSerializing>
@property (nonatomic, strong) NSString* nick_name;
@property (nonatomic, strong) NSString* avatar_url;
@end

@interface PMToken : MTLModel <MTLJSONSerializing>
DEFINE_PROPERTY_STRONG_NSString(avatarUrl);
DEFINE_PROPERTY_STRONG_NSString(city);
DEFINE_PROPERTY_ASSIGN_INT64(createTime);
DEFINE_PROPERTY_STRONG_NSString(drivingYear);
DEFINE_PROPERTY_STRONG_NSString(name);
DEFINE_PROPERTY_ASSIGN_INT32(oauthType);
DEFINE_PROPERTY_STRONG_NSString(phone);
DEFINE_PROPERTY_ASSIGN_INT32(status);
DEFINE_PROPERTY_ASSIGN_INT64(updateTime);
DEFINE_PROPERTY_STRONG_NSString(userId);
DEFINE_PROPERTY_STRONG_NSString(vehicleModel);
@end
