//
//  LTUICarMeetFeed.h
//  LuTu
//
//  Created by stonedong on 15/4/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PMThreadInfo.h"
@interface LTUICarMeetFeed : NSObject
@property (nonatomic, strong) NSURL* feedImageURL;
@property (nonatomic, strong) NSString* carTitle;
@property (nonatomic, strong) NSString* ownerName;
@property (nonatomic, strong) NSString* postDate;
@property (nonatomic, assign) int commentCount;
@property (nonatomic, strong) NSString* threadId;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* content;
@property (nonatomic, strong) NSURL*  userAvatarURL;
@property (nonatomic, strong) NSArray* images;
@property (nonatomic, strong, readonly) PMThreadInfo* threadInfo;
- (instancetype) initWithThreadInfo:(PMThreadInfo*)threadInfo;
@end
