//
//  LTUserInfo.h
//  LuTu
//
//  Created by stonedong on 15/5/5.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MTLModel.h"
#import "PMToken.h"
@interface LTUserInfo : MTLModel <MTLJSONSerializing>
@property (nonatomic, strong) NSString* nickName;
@property (nonatomic, strong) NSString* avatarURL;
@property (nonatomic, strong) NSString* birthDay;

- (instancetype) initWithPMTokenUserInfo:(PMTokenUserInfo*)pUserInfo;
@end
