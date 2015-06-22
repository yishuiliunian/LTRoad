//
//  LTUICarMeetFeed.m
//  LuTu
//
//  Created by stonedong on 15/4/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTUICarMeetFeed.h"
#import "LTGlobals.h"
@implementation LTUICarMeetFeed
- (instancetype) initWithThreadInfo:(PMThreadInfo *)threadInfo
{
    self = [super init];
    if (!self) {
        return self;
    }
    _carTitle = threadInfo.carClubName;
    _ownerName = threadInfo.userName;
    _commentCount = threadInfo.postCount;
    
    NSMutableArray* array = [NSMutableArray new];
    for (PMImageInfo* img  in threadInfo.images) {
        NSURL* url = STR_TO_URL(img.url);
        if (url) {
            [array addObject:url];
        }
    }
    _images = array;
    if (_images.count) {
        _feedImageURL = _images[0];
    } else
    {
        _feedImageURL = nil;
    }
    _threadId = threadInfo.threadId;
    _title = threadInfo.title;
    _content = threadInfo.content;
    _postDate = LTDateShortStringFromInterval(threadInfo.createTime);
    _userAvatarURL = STR_TO_URL(threadInfo.userAvastarurl);
    _threadInfo = threadInfo;
    return self;
}

@end
