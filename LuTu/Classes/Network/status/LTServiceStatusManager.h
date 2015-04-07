//
//  LTServiceStatusManager.h
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LTServiceStatusShareManager [LTServiceStatusManager shareManager]
#define isLTServiceOnline [LTServiceStatusShareManager isServiceOnline]
@interface LTServiceStatusManager : NSObject
+ (LTServiceStatusManager*) shareManager;
@property (nonatomic, readonly, assign) BOOL isServiceOnline;
@end
