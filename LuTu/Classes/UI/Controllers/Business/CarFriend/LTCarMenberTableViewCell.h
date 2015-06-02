//
//  LTCarMenberTableViewCell.h
//  LuTu
//
//  Created by stonedong on 15/6/2.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DZProgramDefines.h>
#import "LTHeadImageView.h"
#import "LTUIClubMember.h"
@interface LTCarMenberTableViewCell : UITableViewCell
DEFINE_PROPERTY_STRONG(LTHeadImageView*, avatarImageView);
DEFINE_PROPERTY_STRONG_UILabel(nickNameLabel);
DEFINE_PROPERTY_STRONG_UILabel(detaiLabel);
DEFINE_PROPERTY_STRONG(LTUIClubMember*, clubMember);
@end
