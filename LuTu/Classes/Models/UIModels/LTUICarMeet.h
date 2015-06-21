//
//  LTUICarMeet.h
//  LuTu
//
//  Created by stonedong on 15/4/13.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PMUserCarClubSimpleInfo.h"
#import "PMClubSearchInfo.h"
#import "PMUserClubInfo.h"
@interface LTUICarMeet : NSObject
@property (nonatomic, strong) NSString* clubID;
@property (nonatomic, strong) NSString* key;
@property (nonatomic, strong) NSURL* emblemURL;
@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* detail;

- (instancetype) initWithSimpleInfo:(PMUserCarClubSimpleInfo*)info;

- (instancetype) initWithSearchInfo:(PMClubSearchInfo*)info;
- (instancetype) initWithClubInfo:(PMUserClubInfo*)info;
@end

