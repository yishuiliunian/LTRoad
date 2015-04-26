//
//  LTCategoryListReq.h
//  LuTu
//
//  Created by stonedong on 15/4/26.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MSRequest.h"

@interface LTCategoryListReq : MSRequest
@property (nonatomic, assign) NSInteger pageID;
@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, strong) NSString* city;
@end
