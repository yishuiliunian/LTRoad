//
//  LTTopicHeadView.h
//  LuTu
//
//  Created by stonedong on 15/5/16.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DZGeometryTools.h>
#import <DZProgramDefines.h>
#import "LTHeadImageView.h"
@interface LTTopicHeadView : UIView
DEFINE_PROPERTY_STRONG(LTHeadImageView*, avatarImageView);
DEFINE_PROPERTY_STRONG_UILabel(nickLabel);
DEFINE_PROPERTY_STRONG_UILabel(timeLabel);
DEFINE_PROPERTY_STRONG_UILabel(roleLabel);
@end
