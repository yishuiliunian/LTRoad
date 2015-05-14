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

/**
 *  定义了各种常用的Haneke的format，以简化使用
 *
 */
EXTERN_LTHNKShareCacheFormat(FeedBackground)
EXTERN_LTHNKShareCacheFormat(DiscoverBackground)
EXTERN_LTHNKShareCacheFormat(CarMeet)
EXTERN_LTHNKShareCacheFormat(Avatar)



@interface UIImageView (PlaceHolder)
- (void) loadRemoteURL:(NSURL*)url placeHolderName:(NSString*) placeHolder;
- (void) loadAvatarURL:(NSURL*)url;
- (void) loadFeedBackgroundURL:(NSURL*)url;
- (void) loadLittleImageURL:(NSURL*)url;
@end