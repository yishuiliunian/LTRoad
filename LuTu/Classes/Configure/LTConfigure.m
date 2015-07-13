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
#import "LTRoadListReq.h"
#import <BaiduMapAPI/BMapKit.h>
#import "SAReqManager.h"
#import "MSLog.h"
#import "LTAppearenceTools.h"
#import "LTLocationManager.h"


void SetupSocialNetwork()
{
    [[SAReqManager shareManager] registerWeChatApp:@"wx59f6360bf2a79416" scret:@"37fce920dd26a908b9457463a785307a"];
    [SAAuthShareManager registerTencentApp:@"1104574933"];
    [SAAuthShareManager registerWeiboAppID:@"1794232399" secret:@"1792eb3262b7d9405471e22662469b5a"];
}
 void LTApplicationSetup()
{
    LTAppearanceSetup();
    [MSLog setup];
    SetupSocialNetwork();
    [DZImageShareCache setupAssetsSourceType];
    [[LTLocationManager shareManager] setup];
}
