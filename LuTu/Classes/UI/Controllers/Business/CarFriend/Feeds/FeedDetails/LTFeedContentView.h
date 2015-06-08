//
//  LTFeedContentView.h
//  LuTu
//
//  Created by stonedong on 15/5/16.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DZProgramDefines.h>
#import "LTGrowLabel.h"
#import "LTGrowImageView.h"
@interface LTFeedContentView : UIView
DEFINE_PROPERTY_STRONG(LTGrowImageView*,imageView);
DEFINE_PROPERTY_STRONG(LTGrowLabel*,contentLabel);
@end
