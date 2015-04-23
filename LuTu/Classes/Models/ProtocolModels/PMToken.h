//
//  PMToken.h
//  LuTu
//
//  Created by stonedong on 15/4/23.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MTLModel.h"

@interface PMToken : MTLModel
@property (nonatomic, strong) NSString* access_token;
@property (nonatomic, assign) int expiration;
@property (nonatomic, assign) BOOL auth_first;
@property (nonatomic, assign) BOOL auth_success;
@end
