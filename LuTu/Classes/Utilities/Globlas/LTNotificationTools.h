//
//  LTNotificationTools.h
//  LuTu
//
//  Created by stonedong on 15/5/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
void LTAddObserverForCityReload(NSObject* ob, SEL selector);
void LTRemoveObserverForCityReload(NSObject* ob);
void LTPostCityReloadMessage(NSString* cityNew);