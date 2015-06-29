//
//  LTUserInfo.h
//  LuTu
//
//  Created by stonedong on 15/5/5.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MTLModel.h"
#import "PMTokenAuthRsp.h"
@interface LTUserInfo : MTLModel <MTLJSONSerializing>
@property (nonatomic, strong) NSString* nickName;
@property (nonatomic, strong) NSString* avatarURL;
@property (nonatomic, strong) NSString* phone;
@property (nonatomic, strong) NSString* city;
@property (nonatomic, strong) NSString* drivingYear;
@property (nonatomic, strong) NSString* status;

- (instancetype) initWithPMTokenUserInfo:(PMTokenAuthRsp*)pUserInfo;
@end
