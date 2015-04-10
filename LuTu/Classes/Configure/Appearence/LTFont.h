//
//  LTFont.h
//  LuTu
//
//  Created by stonedong on 15/4/8.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define DEFINE_EXTERN_FONT(name) FOUNDATION_EXTERN UIFont* LTFont##name();

DEFINE_EXTERN_FONT(Title)
DEFINE_EXTERN_FONT(Detail)
DEFINE_EXTERN_FONT(Date)
DEFINE_EXTERN_FONT(Like)
DEFINE_EXTERN_FONT(Tag)
