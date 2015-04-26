//
//  LTRecommondReadDataController.h
//  LuTu
//
//  Created by stonedong on 15/4/20.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTPageDataController.h"
#import "LTRecommondRoadReq.h"
@interface LTRecommondReadDataController : LTPageDataController
@property (nonatomic, strong) NSString* keyword;
@property (nonatomic, strong) NSString* category;
@end
