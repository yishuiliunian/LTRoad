//
//  LTServiceStatusManager.m
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTServiceStatusManager.h"
#import <DZSingletonFactory.h>
#import "LTCheckServiceReq.h"

@interface LTServiceStatusManager () <MSRequestUIDelegate>

@end

@implementation LTServiceStatusManager
+ (LTServiceStatusManager*) shareManager
{
    return DZSingleForClass([self class]);
}

- (void) commoInit
{
    _isServiceOnline = YES;
    [self checkService];
}
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    [self commoInit];
    return self;
}


- (void) checkService
{
    LTCheckServiceReq* checkReq = [LTCheckServiceReq new];
    checkReq.uidelegate = self;
    [MSDefaultSyncCenter performRequest:checkReq];
}

- (void) request:(MSRequest *)request onError:(NSError *)error
{
    _isServiceOnline = NO;
}

- (void) request:(MSRequest *)request onSucced:(id)object
{
    _isServiceOnline = YES;
}

@end
