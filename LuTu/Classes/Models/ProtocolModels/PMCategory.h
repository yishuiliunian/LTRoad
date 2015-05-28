//
//  PMCategory.h
//  LuTu
//
//  Created by stonedong on 15/4/26.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle.h>

@interface PMCategory : MTLModel <MTLJSONSerializing>
@property (nonatomic, strong) NSString* categoryId;
@property (nonatomic, strong) NSString*introImageUrl;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, assign) int routeCount;
@property (nonatomic, strong) NSString* label;
@end
