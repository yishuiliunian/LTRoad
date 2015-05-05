//
//  LTCarClubReq.h
//  LuTu
//
//  Created by stonedong on 15/5/5.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MSRequest.h"

@interface LTCarClubReq : MSRequest
@property (nonatomic, strong) NSString* city;
@property (nonatomic, assign) int pageId;
@property (nonatomic, strong) NSString* keyword;
@property (nonatomic, assign) int pageSize;
@end
