//
//  LTFeedView.h
//  LuTu
//
//  Created by stonedong on 15/5/16.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTTopicHeadView.h"
#import "LTFeedHeadView.h"
#import "LTFeedContentView.h"
#import <DZProgramDefines.h>
@interface LTFeedView : UIView
DEFINE_PROPERTY_STRONG(LTFeedHeadView*, feedHeaderView);
DEFINE_PROPERTY_STRONG(LTTopicHeadView*, topicHeaderView);
DEFINE_PROPERTY_STRONG(LTFeedContentView*, feedContentView);
@end
