//
//  LTFont.m
//  LuTu
//
//  Created by stonedong on 15/4/8.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTFont.h"


#define DEFINE_SYSTEM_FONT(name, size) UIFont* LTFont##name() {\
    static UIFont* font = nil;\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        font = [UIFont systemFontOfSize:size];\
    });\
return font;\
}


DEFINE_SYSTEM_FONT(Title, 15)
DEFINE_SYSTEM_FONT(Detail, 13);
DEFINE_SYSTEM_FONT(Date, 13);
DEFINE_SYSTEM_FONT(Like, 13);
DEFINE_SYSTEM_FONT(Tag, 13);
DEFINE_SYSTEM_FONT(POIDetail, 15)