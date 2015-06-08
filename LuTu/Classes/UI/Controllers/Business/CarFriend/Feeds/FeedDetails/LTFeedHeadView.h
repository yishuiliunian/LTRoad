//
//  LTFeedHeadView.h
//  LuTu
//
//  Created by stonedong on 15/5/16.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DZProgramDefines.h>
#import "LTLikeButton.h"
#import "AdjustFrame.h"
#import "LTGrowLabel.h"

@interface LTFeedHeadView : UIView
DEFINE_PROPERTY_STRONG(LTGrowLabel*,titleLabel);
DEFINE_PROPERTY_STRONG(LTLikeButton*, commentButton);
DEFINE_PROPERTY_STRONG(LTLikeButton*, lookedCountButton);
DEFINE_PROPERTY_STRONG_UILabel(clubNickLabel);
@end
