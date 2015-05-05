//
//  LTConfigure.m
//  LuTu
//
//  Created by stonedong on 15/4/11.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//
//  Created by stonedong on 15/4/11.

#import "LTConfigure.h"
#import <DZImageCache.h>
#import "LTRoteListReq.h"
#import <BMapKit.h>
#import <SAAuth/SAReqManager.h>
#import "MSLog.h"


void SetupSocialNetwork()
{
    [[SAReqManager shareManager] registerWeChatApp:@"wx59f6360bf2a79416" scret:@"37fce920dd26a908b9457463a785307a"];
}
 void LTApplicationSetup()
{
    [MSLog setup];
    SetupSocialNetwork();
    [DZImageShareCache setupAssetsSourceType];
    [[[BMKMapManager alloc] init]  start:@"fqYUrYb3PnInVt6GUSYxlbU8" generalDelegate:nil];
}
