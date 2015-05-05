//
//  LTRoteListReq.h
//  LuTu
//
//  Created by stonedong on 15/4/20.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MSRequest.h"
#import "LTNetworkConfigure.h"
#import "LTPageRequestProtocol.h"
@interface LTRoteListReq : MSRequest <LTPageRequestProtocol>
@property (nonatomic, strong) NSString* city;
@property (nonatomic, strong) NSString* keyword;
@property (nonatomic, strong) NSString* category;
@end
