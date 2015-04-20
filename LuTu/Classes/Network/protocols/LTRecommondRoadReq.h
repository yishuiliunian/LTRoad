//
//  MSRecommondRoadReq.h
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MSRequest.h"

@interface LTRecommondRoadReq : MSRequest
@property (nonatomic, strong) NSString* city;
@property (nonatomic, strong) NSString* keyword;
@property (nonatomic, assign) int pageID;
@property (nonatomic, assign) int tagID;
@property (nonatomic, assign) int pageSize;
@end
