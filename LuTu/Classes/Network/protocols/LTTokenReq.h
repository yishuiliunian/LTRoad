//
//  LTTokenReq.h
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MSRequest.h"
#import <SAAuth/SAToken.h>
@interface LTTokenReq : MSRequest
@property (nonatomic, strong) NSString* openID;
@property (nonatomic, strong) NSString* accessToken;
@property (nonatomic, assign) SATokenType type;
@end
