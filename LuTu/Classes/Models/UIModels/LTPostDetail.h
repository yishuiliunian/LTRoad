//
//  LTPostDetail.h
//  LuTu
//
//  Created by stonedong on 15/5/16.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTGlobals.h"
@interface LTPostDetail : NSObject
DEFINE_PROPERTY_STRONG_NSString(title);
DEFINE_PROPERTY_STRONG_NSString(clubName);
DEFINE_PROPERTY_STRONG_NSString(owerName);
DEFINE_PROPERTY_STRONG_NSString(dateString);
DEFINE_PROPERTY_STRONG_NSString(role);
DEFINE_PROPERTY_ASSIGN_INT32(lookedCount);
DEFINE_PROPERTY_ASSIGN_INT32(commentCount);
DEFINE_PROPERTY_STRONG(NSURL*, avatarImageURL);
DEFINE_PROPERTY_STRONG(NSURL*, contentImageURL);
DEFINE_PROPERTY_STRONG_NSString(contentText);
@end
