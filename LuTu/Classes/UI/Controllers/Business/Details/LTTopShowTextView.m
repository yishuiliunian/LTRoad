//
//  LTTopShowTextView.m
//  LuTu
//
//  Created by stonedong on 15/4/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTTopShowTextView.h"
#import <DZProgramDefines.h>
#import "LTColors.h"
#import "LTGlobals.h"
@implementation LTTopShowTextView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SELF_SUBVIEW_UILabel(_topLabel);
    _topView = _topLabel;
    _topLabel.textColor = LTColorBalckAlpha8();
    _topLabel.textAlignment = NSTextAlignmentCenter;
    _topLabel.font = LTFontTitle();
    return self;
}

@end
