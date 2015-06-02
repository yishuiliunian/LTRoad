//
//  LKHaneke.m
//  LuTu
//
//  Created by stonedong on 15/4/10.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LKHaneke.h"
#import <Haneke.h>
#import <DZGeometryTools.h>
#import <DZImageCache.h>
HNKCacheFormat* HNKCreateCacheFormatWithSize(CGSize size, NSString* key)  {
    HNKCacheFormat* format = [HNKCache sharedCache].formats[key];
    if (!format) {
        format  = [[HNKCacheFormat alloc] initWithName:key];
        format.size = size;
        format.scaleMode = HNKScaleModeAspectFill;
        format.compressionQuality = 0.5;
        format.diskCapacity = 300*1024*1024;
        format.preloadPolicy = HNKPreloadPolicyLastSession;
        [[HNKCache sharedCache] registerFormat:format];
    }
    return format;
}


#define LTHNKShareCacheFormat(width, height, key) HNKCacheFormat* LTHanekeCacheFormat##key() { \
    static HNKCacheFormat* format = nil;\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        format = HNKCreateCacheFormatWithSize(CGSizeMake(width, height), @""#key);\
    });\
    return format;\
}


LTHNKShareCacheFormat(CGCurrentScreenSize().width, 300, FeedBackground)
LTHNKShareCacheFormat(200, 300, DiscoverBackground)
LTHNKShareCacheFormat(100, 100, CarMeet)
LTHNKShareCacheFormat(100, 100, Avatar)




@implementation UIImageView (PlaceHolder)

- (void) loadRemoteURL:(NSURL*)url placeHolderName:(NSString*) placeHolder
{
    [self hnk_setImageFromURL:url placeholder:DZCachedImageByName(placeHolder)];
}

- (void) loadAvatarURL:(NSURL*)url
{
    [self loadRemoteURL:url placeHolderName:@"avatar_default"];
}

- (void) loadFeedBackgroundURL:(NSURL*)url
{
    [self loadRemoteURL:url placeHolderName:@"cover"];
}

- (void) loadLittleImageURL:(NSURL*)url
{
    [self loadRemoteURL:url placeHolderName:@"cover"];
}

- (void) loadImageURLWithDefaultPlaceHoler:(NSURL*)url
{
    [self loadRemoteURL:url placeHolderName:@"cover"];
}
@end

void LKLoadRemoteURLWithPlaceHolder(UIImageView* imageView , NSURL* url, NSString* placeHolderName) {
    
}