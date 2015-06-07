//
//  LTUIRouteSearchInfo.h
//  LuTu
//
//  Created by stonedong on 15/6/7.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PMRouteSearchInfo.h"
@interface LTUIRouteSearchInfo : NSObject
@property (nonatomic, strong) NSURL* introImageURL;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* timeText;

- (instancetype) initWithRouteInfo:(PMRouteSearchInfo*)info;
@end
