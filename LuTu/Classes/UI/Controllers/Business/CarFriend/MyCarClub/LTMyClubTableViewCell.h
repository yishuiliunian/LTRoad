//
//  LTMyClubTableViewCell.h
//  LuTu
//
//  Created by stonedong on 15/4/29.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DZProgramDefines.h>
#import "LTUICarMeet.h"
#import "LTCommonTTableViewCellLayoutProtocol.h"
@class LTMyClubTableViewCell;
@protocol LTClubActionProtocol
- (void) clubTableViewCell:(LTMyClubTableViewCell*)cell toggleActionWithMeet:(LTUICarMeet*)meet;
@end

@interface LTMyClubTableViewCell : UITableViewCell <LTCommonTTableViewCellLayoutProtocol>
@property (nonatomic, strong) LTUICarMeet* carClubInfo;
DEFINE_PROPERTY_STRONG_UIImageView(avatarImageView);
DEFINE_PROPERTY_STRONG_UILabel(titleLabel);
DEFINE_PROPERTY_STRONG_UILabel(detailLabel);
DEFINE_PROPERTY_STRONG_UIButton(exitButton);
DEFINE_PROPERTY_WEAK(NSObject<LTClubActionProtocol>*, actionTarget);

- (void) showInfoWithEnter;
- (void) showINfoWithExit;
@end
