//
//  LTLocationManager.h
//  LuTu
//
//  Created by stonedong on 15/4/26.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PMLinePoint.h"
#define LTShareLocationManger  [LTLocationManager shareManager]
@interface LTLocationManager : NSObject
+ (LTLocationManager*) shareManager;
@property (nonatomic, strong, readonly) NSString* currentCity;
- (NSString*) userDistanceToPoint:(PMLinePoint*)point;
@end
