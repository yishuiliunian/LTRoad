//
//  LTRecommondLineCell.h
//  LuTu
//
//  Created by stonedong on 15/4/8.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTRecommendLine.h"
#import <DZProgramDefines.h>
#import "LTLikeButton.h"
#import "LTBadgeContentView.h"
@interface LTRecommondLineCell : UITableViewCell
@property (nonatomic, strong) LTRecommendLine* line;
DEFINE_PROPERTY_STRONG_UIImageView(backgroundImageView);
DEFINE_PROPERTY_STRONG_UILabel(dateLabel);
DEFINE_PROPERTY_STRONG_UILabel(distanceLabel);
DEFINE_PROPERTY_STRONG(LTLikeButton*, likeButton);
DEFINE_PROPERTY_STRONG(UIImageView*, distanceIconImageView);
DEFINE_PROPERTY_STRONG(LTBadgeContentView*, badgesView);
@end

