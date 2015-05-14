//
//  PMToken.h
//  LuTu
//
//  Created by stonedong on 15/4/23.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle.h>
@interface PMTokenUserInfo : MTLModel <MTLJSONSerializing>
@property (nonatomic, strong) NSString* nick_name;
@property (nonatomic, strong) NSString* avatar_url;
@end

@interface PMToken : MTLModel <MTLJSONSerializing>
@property (nonatomic, strong) NSString* access_token;
@property (nonatomic, assign) int64_t expiration;
@property (nonatomic, assign) BOOL auth_first;
@property (nonatomic, assign) BOOL auth_success;
@property (nonatomic, strong) NSString* open_id;
@property (nonatomic, strong) PMTokenUserInfo* oauth_user_info;
@end
