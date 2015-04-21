//
//  PMNoticePOI.h
//  LuTu
//
//  Created by stonedong on 15/4/21.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MTLModel.h"
#import "PMLinePoint.h"
#import <Mantle.h>
@interface PMNoticePOI : MTLModel <MTLJSONSerializing>
@property (nonatomic, strong) NSString* arrival_time;
@property (nonatomic, strong) NSString* intro_image_url;
@property (nonatomic, strong) PMLinePoint* location;
@end
