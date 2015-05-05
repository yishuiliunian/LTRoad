//
//  LTAccount.h
//  MoShang
//
//  Created by stonedong on 15/2/7.
//  Copyright (c) 2015年 stonedong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle.h>
#import "LTUserInfo.h"
@interface LTAccount : MTLModel <MTLJSONSerializing>
@property (nonatomic, strong) NSString* accountID;
@property (nonatomic, strong) NSString* openId;
@property (nonatomic, strong) NSString* openAccessToken;
@property (nonatomic, strong) LTUserInfo* userInfo;
@end
