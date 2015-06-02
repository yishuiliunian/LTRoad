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
@property (nonatomic, strong) NSString* detail;
@property (nonatomic, assign) int commentCount;

- (instancetype) initWithThreadInfo:(PMThreadInfo*)threadInfo;
@end
