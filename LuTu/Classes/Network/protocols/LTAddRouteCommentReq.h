//
//  LTAddRouteCommentReq.h
//  LuTu
//
//  Created by stonedong on 15/5/28.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MSRequest.h"

@interface LTAddRouteCommentReq : MSRequest
@property (nonatomic, strong) NSString* content;
@property (nonatomic, strong) NSString* creatorId;
@property (nonatomic, strong) NSString* routeId;
@end
