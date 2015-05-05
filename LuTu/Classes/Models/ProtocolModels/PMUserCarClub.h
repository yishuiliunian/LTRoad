//
//  PMUserCarClub.h
//  LuTu
//
//  Created by stonedong on 15/5/5.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "MTLModel.h"
#import <DZProgramDefines.h>
@interface PMUserCarClub : MTLModel
DEFINE_PROPERTY_STRONG_NSString(intro_image_url);
DEFINE_PROPERTY_STRONG_NSString(name);
DEFINE_PROPERTY_ASSIGN_INT32(member_count);
DEFINE_PROPERTY_ASSIGN_INT32(thread_count);
DEFINE_PROPERTY_ASSIGN_INT32(club_id);
@end
