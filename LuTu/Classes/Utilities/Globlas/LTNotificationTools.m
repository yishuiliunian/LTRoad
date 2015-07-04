//
//  LTNotificationTools.m
//  LuTu
//
//  Created by stonedong on 15/5/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTNotificationTools.h"


#define LTObserverMessage(message) \
void LTAddObserverFor##message (NSObject* ob, SEL selector) { \
    [[NSNotificationCenter defaultCenter] addObserver:ob selector:selector name:@""#message object:nil]; \
}\
\
void LTRemoveObserverFor##message (NSObject* ob) {\
    [[NSNotificationCenter defaultCenter] removeObserver:ob name:@""#message object:nil];\
}\
\
void LTPost##message () {\
    [[NSNotificationCenter defaultCenter] postNotificationName:@""#message object:nil];\
}


LTObserverMessage(CityReload)
LTObserverMessage(AccountLoad)

