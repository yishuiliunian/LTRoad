//
//  LTCarMeetCell.h
//  LuTu
//
//  Created by stonedong on 15/4/13.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "DZExpandCollectionViewCell.h"
#import <DZProgramDefines.h>
#import "LTUICarMeet.h"
@interface LTCarMeetCell : DZExpandCollectionViewCell
@property (nonatomic, strong) LTUICarMeet* carMeet;
DEFINE_PROPERTY_STRONG(UIView*, menuView);
DEFINE_PROPERTY_STRONG_UIImageView(emblemImageView);
DEFINE_PROPERTY_STRONG_UILabel(titleLabel);
@end
