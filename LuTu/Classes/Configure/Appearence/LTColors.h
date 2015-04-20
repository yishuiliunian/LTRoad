//
//  LTColors.h
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LTExternColor(name) FOUNDATION_EXTERN UIColor* LTColor##name ();
#define LTColorFunction(name) LTColor##name ()

LTExternColor(Pink)
LTExternColor(PinkDeep)
LTExternColor(Green)
LTExternColor(Gray)
LTExternColor(GrayDeep)
LTExternColor(GrayEC)
LTExternColor(GrayEE)
LTExternColor(GrayEF)
LTExternColor(GrayF4)
LTExternColor(GrayBB)
LTExternColor(GrayBC)
LTExternColor(BalckAlpha8)
LTExternColor(BalckAlpha7)
LTExternColor(BalckAlpha6)
LTExternColor(BalckAlpha5)
LTExternColor(BalckAlpha4)
LTExternColor(BalckAlpha3)
LTExternColor(BalckAlpha2)
LTExternColor(White)
LTExternColor(WhiteAlpha7)
LTExternColor(WhiteSmoke)