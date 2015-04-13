//
//  LKHaneke.h
//  LuTu
//
//  Created by stonedong on 15/4/10.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Haneke.h>

#define EXTERN_LTHNKShareCacheFormat(name) FOUNDATION_EXTERN  HNKCacheFormat* LTHanekeCacheFormat##name();


EXTERN_LTHNKShareCacheFormat(FeedBackground)
EXTERN_LTHNKShareCacheFormat(DiscoverBackground)
EXTERN_LTHNKShareCacheFormat(CarMeet)