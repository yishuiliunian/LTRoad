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
#import "LTCarMeetMenuView.h"
@class LTCarMeetCell;
@protocol LTCarMeetCellDelegate
- (void) carMeetCell:(LTCarMeetCell*)cell didTapOnMenuItem:(id)sender;
@end
@interface LTCarMeetCell : DZExpandCollectionViewCell
@property (nonatomic, weak) NSObject <LTCarMeetCellDelegate>* delegate;
@property (nonatomic, strong) LTUICarMeet* carMeet;
DEFINE_PROPERTY_STRONG(LTCarMeetMenuView*, menuView);
DEFINE_PROPERTY_STRONG_UIImageView(emblemImageView);
DEFINE_PROPERTY_STRONG_UILabel(titleLabel);
@end
