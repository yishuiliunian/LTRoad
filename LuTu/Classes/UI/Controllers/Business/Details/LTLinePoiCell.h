//
//  LTLinePoiCell.h
//  LuTu
//
//  Created by stonedong on 15/4/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTLikeButton.h"
#import "LTUIPoi.h"

@interface LTLinePoiCell : UITableViewCell
@property (nonatomic, strong, readonly) UIImageView* timeIndicatorImageView;
@property (nonatomic, strong, readonly) LTPointView* pointView;
@property (nonatomic, strong, readonly) UIView* lineView;
@property (nonatomic, strong, readonly) UILabel* titleLabel;
@property (nonatomic, strong, readonly) UIView* contentBackgroundView;
@property (nonatomic, strong) LTLikeButton* likeButton;
@property (nonatomic, strong) UIImageView* introImageView;
@property (nonatomic, strong) UILabel* contentTextLabel;
@property (nonatomic, strong) UILabel* timeLabel;
@property (nonatomic, strong) LTUIPoi* poiInfos;
@end
