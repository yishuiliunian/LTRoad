//
//  LTRouteInfoView.h
//  LuTu
//
//  Created by stonedong on 15/5/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DZProgramDefines.h>
#import "LTBadgeContentView.h"
#import "DZAdjustHeightTools.h"
#import "LTGrowLabel.h"
#import "AdjustFrame.h"
@interface LTRouteInfoView : UIView
DEFINE_PROPERTY_STRONG(LTGrowLabel*,detailLabel);
DEFINE_PROPERTY_STRONG(LTBadgeContentView*, badgeContentView);
@end
