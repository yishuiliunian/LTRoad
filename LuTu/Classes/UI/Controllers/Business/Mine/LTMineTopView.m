//
//  LTMineTopView.m
//  LuTu
//
//  Created by stonedong on 15/4/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTMineTopView.h"

@implementation LTMineTopView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SELF_SUBVIEW_UIImageView(_backgroundImageView);
    INIT_SELF_SUBVIEW_UIImageView(_avatarImageView);
    INIT_SELF_SUBVIEW(LTBottomLabelButton, _messageButton);
    INIT_SELF_SUBVIEW(LTBottomLabelButton, _settingButton);
    INIT_SELF_SUBVIEW(LTBackButton, _favarateButton);
    INIT_SELF_SUBVIEW(LTBackButton, _feedButton);
    INIT_SELF_SUBVIEW(LTBackButton, _carFriendButton);
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    _backgroundImageView.frame = self.bounds;
    
}

@end
