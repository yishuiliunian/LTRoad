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

 void LTApplicationSetup()
{
    [DZImageShareCache setupAssetsSourceType];
    [[[BMKMapManager alloc] init]  start:@"fqYUrYb3PnInVt6GUSYxlbU8" generalDelegate:nil];
}
