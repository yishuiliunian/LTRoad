//
//  LTFeedContentView.h
//  LuTu
//
//  Created by stonedong on 15/5/16.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DZProgramDefines.h>
#import "DZAdjustHeightTools.h"
@interface LTFeedContentView : UIView
DEFINE_PROPERTY_HEIGHT
DEFINE_PROPERTY_STRONG_UIImageView(imageView);
DEFINE_PROPERTY_STRONG_UILabel(contentLabel);
@end
