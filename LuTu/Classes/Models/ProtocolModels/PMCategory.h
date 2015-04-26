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
@property (nonatomic, strong) NSString* category_id;
@property (nonatomic, strong) NSString*intro_image_url;
@property (nonatomic, strong) NSString* name;
@end
