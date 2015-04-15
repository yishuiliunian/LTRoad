//
//  LTCarMeetFeedCell.h
//  LuTu
//
//  Created by stonedong on 15/4/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DZProgramDefines.h>
#import "LTUICarMeetFeed.h"
#import "LTLikeButton.h"
@interface LTCarMeetFeedCell : UITableViewCell
@property (nonatomic, strong) LTUICarMeetFeed* carMeetFeed;
DEFINE_PROPERTY_STRONG_UIImageView(feedImageView);
DEFINE_PROPERTY_STRONG_UILabel(carMeetTitleLabel);
DEFINE_PROPERTY_STRONG_UILabel(feedDetailLabel);
DEFINE_PROPERTY_STRONG_UILabel(ownerNameLabel);
DEFINE_PROPERTY_STRONG(LTLikeButton*, commentButton);
@end
