//
//  LTMyClubTableViewCell.h
//  LuTu
//
//  Created by stonedong on 15/4/29.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DZProgramDefines.h>
#import "LTUIMyCarClubInfo.h"
#import "LTCommonTTableViewCellLayoutProtocol.h"
@interface LTMyClubTableViewCell : UITableViewCell <LTCommonTTableViewCellLayoutProtocol>
@property (nonatomic, strong) LTUIMyCarClubInfo* carClubInfo;
DEFINE_PROPERTY_STRONG_UIImageView(avatarImageView);
DEFINE_PROPERTY_STRONG_UILabel(titleLabel);
DEFINE_PROPERTY_STRONG_UILabel(detailLabel);
DEFINE_PROPERTY_STRONG_UIButton(exitButton);
@end
