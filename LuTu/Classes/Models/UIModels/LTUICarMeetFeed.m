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
    _carTitle = threadInfo.title;
    _ownerName = threadInfo.userName;
    _detail = threadInfo.content;
    _commentCount = threadInfo.postCount;
    _feedImageURL = STR_TO_URL(threadInfo.userAvastarurl);
    _threadId = threadInfo.threadId;
    return self;
}

- (instancetype) initWithSearchInfo:(PMThreadSearchInfo *)searchInfo
{
    self = [super init];
    if (!self) {
        return self;
    }
    _carTitle = searchInfo.title;
    _ownerName = searchInfo.userName;
    _commentCount = searchInfo.postCount;
    _threadId = searchInfo.threadId;

    return self;
}

- (instancetype) initWithUserThreadInfo:(PMUserThreadInfo *)threadInfo
{
    self  = [super init];
    if (!self) {
        return self;
    }
    
    _carTitle = threadInfo.title;
    _ownerName = threadInfo.userName;
    _detail = threadInfo.content;
    _commentCount = threadInfo.postCount;
    _postDate = @"2012/1/1";
    _threadId = threadInfo.threadId;
    return self;
}
@end
