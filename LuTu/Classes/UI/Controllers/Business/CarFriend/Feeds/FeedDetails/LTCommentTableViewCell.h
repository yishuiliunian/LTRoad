//
//  LTCommentTableViewCell.h
//  LuTu
//
//  Created by stonedong on 15/5/16.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTUIComment.h"
#import "LTTopicHeadView.h"
#import "LTGlobals.h"
@interface LTCommentTableViewCell : UITableViewCell
DEFINE_PROPERTY_STRONG(LTTopicHeadView*, headerView);
DEFINE_PROPERTY_STRONG(UILabel*, contentTextLabel);
@property (nonatomic, strong) LTUIComment* comment;
@end
