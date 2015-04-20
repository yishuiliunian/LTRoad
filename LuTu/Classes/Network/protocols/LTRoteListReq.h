//
//  LTRoteListReq.h
//  LuTu
//
//  Created by stonedong on 15/4/20.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MSRequest.h"
#import "LTNetworkConfigure.h"

@interface LTRoteListReq : MSRequest
@property (nonatomic, strong) NSString* city;
@property (nonatomic, strong) NSString* keyword;
@property (nonatomic, assign) int pageId;
@property (nonatomic, assign) int pageSize;
@property (nonatomic, strong) NSString* category;
@end
