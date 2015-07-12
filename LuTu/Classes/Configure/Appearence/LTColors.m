//
//  LTColors.m
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTColors.h"
#import <HexColors.h>
#import <Mantle.h>
#define LTColorDefine(name , hex, a) UIColor* LTColor##name()\
{\
static UIColor* pinkColor = nil;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
pinkColor = [UIColor colorWithHexString:@""#hex alpha:a];\
});\
return pinkColor;\
}


LTColorDefine(Pink, fb154f, 1)
LTColorDefine(PinkDeep, fd1f65, 1);

LTColorDefine(White, ffffff, 1)
LTColorDefine(Green, 60cc71, 1)
LTColorDefine(Gray, 444444, 1)
LTColorDefine(GrayDeep, 707070, 1)
LTColorDefine(GrayEC, ececec, 1)
LTColorDefine(GrayEE, eeeeee, 1)
LTColorDefine(GrayEF, efefef, 1)
LTColorDefine(GrayF4, f4f4f4, 1)
LTColorDefine(GrayBB, bbbbbb, 1)
LTColorDefine(GrayBC, bcbcbc, 1)
LTColorDefine(ToolbarGray, f6f6f6, 1)

LTColorDefine(GrayNormal, a6a6a6, 1)

LTColorDefine(BalckAlpha8, 000000, 0.8)
LTColorDefine(BalckAlpha7, 000000, 0.7)
LTColorDefine(BalckAlpha6, 000000, 0.6)
LTColorDefine(BalckAlpha5, 000000, 0.5)
LTColorDefine(BalckAlpha4, 000000, 0.4)
LTColorDefine(BalckAlpha3, 000000, 0.3)
LTColorDefine(BalckAlpha2, 000000, 0.2)

LTColorDefine(WhiteSmoke, f7f7f7, 1);
LTColorDefine(WhiteAlpha7, ffffff, 0.7)

LTColorDefine(TagDefault, 333333, 1)

LTColorDefine(BackgroundGray, f0f3f8, 1)
LTColorDefine(PointGray, dfdee4, 1)

LTColorDefine(DetailGray, 999999, 1)
LTColorDefine(ButtonBlue, 0098ee, 1)

void ColorLabelWithWhite (UILabel* label) {
    label.textColor = LTColorWhite();
}