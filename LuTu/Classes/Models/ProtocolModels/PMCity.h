//
//  PMCity.h
//  LuTu
//
//  Created by stonedong on 15/5/12.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle.h>
@interface PMCity : MTLModel <MTLJSONSerializing>
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* cityID;
@end
