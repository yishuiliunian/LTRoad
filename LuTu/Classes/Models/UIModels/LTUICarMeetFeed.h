//
//  LTUICarMeetFeed.h
//  LuTu
//
//  Created by stonedong on 15/4/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PMThreadInfo.h"
#import "PMThreadSearchInfo.h"
#import "PMUserThreadInfo.h"
@interface LTUICarMeetFeed : NSObject
@property (nonatomic, strong) NSURL* feedImageURL;
@property (nonatomic, strong) NSString* carTitle;
@property (nonatomic, strong) NSString* ownerName;
@property (nonatomic, strong) NSString* postDate;
@property (nonatomic, assign) int commentCount;
@property (nonatomic, strong) NSString* threadId;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* content;

- (instancetype) initWithThreadInfo:(PMThreadInfo*)threadInfo;
- (instancetype) initWithSearchInfo:(PMThreadSearchInfo*)searchInfo;
- (instancetype) initWithUserThreadInfo:(PMUserThreadInfo*)threadInfo;
@end
