//
//  PMRecommondLine.h
//  LuTu
//
//  Created by stonedong on 15/4/20.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MTLModel.h"
#import "PMNoticePOI.h"
#import <Mantle.h>
@interface PMRecommondLine : MTLModel <MTLJSONSerializing>
@property (nonatomic, strong) NSArray* category;
@property (nonatomic, assign) int fav_count;
@property (nonatomic, strong) NSString* route_id;
@property (nonatomic, strong) NSString* route_name;
@property (nonatomic, strong) NSString* tag;
@property (nonatomic, strong) PMNoticePOI* notice_poi;
@end


