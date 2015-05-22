//
//  PMRoteListRsp.h
//  LuTu
//
//  Created by stonedong on 15/5/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle.h>
#import <DZProgramDefines.h>
@interface PMRoteListRsp : MTLModel <MTLJSONSerializing>
DEFINE_PROPERTY_ASSIGN_INT32(count);
DEFINE_PROPERTY_ASSIGN_INT32(limit);
DEFINE_PROPERTY_ASSIGN_INT32(offset);
DEFINE_PROPERTY_ASSIGN_INT32(total);
DEFINE_PROPERTY_STRONG_NSArray(list);
@end
