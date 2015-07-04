//
//  LTMineTopView.h
//  LuTu
//
//  Created by stonedong on 15/4/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DZImageCache.h>
#import <DZProgramDefines.h>
#import "LTBottomLabelButton.h"
#import "LTBackButton.h"
@interface LTMineTopView : UIView
@property (nonatomic, assign, readonly) CGFloat minHeight;
DEFINE_PROPERTY_STRONG_UIImageView(backgroundImageView);
DEFINE_PROPERTY_STRONG_UIImageView(avatarImageView);
DEFINE_PROPERTY_STRONG(LTBottomLabelButton*, messageButton);
DEFINE_PROPERTY_STRONG(LTBottomLabelButton*, settingButton);
DEFINE_PROPERTY_STRONG(LTBackButton*, favarateButton);
DEFINE_PROPERTY_STRONG(LTBackButton*, feedButton);
DEFINE_PROPERTY_STRONG(LTBackButton*, carFriendButton);
DEFINE_PROPERTY_STRONG_UILabel(nickNameLabel);
DEFINE_PROPERTY_STRONG(RKNotificationHub*, messageHUB);
@end
