//
//  LTNotificationTools.m
//  LuTu
//
//  Created by stonedong on 15/5/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTNotificationTools.h"


static NSString* const kLTCityReloadNotification = @"kLTCityReloadNotification";

void LTAddObserverForCityReload(NSObject* ob, SEL selector) {
    [[NSNotificationCenter defaultCenter] addObserver:ob selector:selector name:kLTCityReloadNotification object:nil];
}

void LTRemoveObserverForCityReload(NSObject* ob) {
    [[NSNotificationCenter defaultCenter] removeObserver:ob name:kLTCityReloadNotification object:nil];
}

void LTPostCityReloadMessage(NSString* cityNew) {
    [[NSNotificationCenter defaultCenter] postNotificationName:kLTCityReloadNotification object:nil];
}