//
//  LTCarMeetTopView.m
//  LuTu
//
//  Created by stonedong on 15/4/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTCarMeetTopView.h"
#import <DZGeometryTools.h>
#import "LKHaneke.h"
@implementation LTCarMeetTopView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SELF_SUBVIEW_UIImageView(_backgroundImageView);
    INIT_SELF_SUBVIEW_UIImageView(_avatarImageView);
    INIT_SELF_SUBVIEW_UILabel(_titleLabel);
    //
    _avatarImageView.hnk_cacheFormat = LTHanekeCacheFormatAvatar();
    return self;
}


- (void) layoutSubviews
{
    [super layoutSubviews];
    _backgroundImageView.frame = self.bounds;
    CGFloat imageHeight = CGRectGetHeight(self.bounds) - 30;
    _avatarImageView.frame = CGRectMake(CGRectWidthOffsetCenter(self.bounds, imageHeight), 0, imageHeight, imageHeight);
    _titleLabel.frame = CGRectMake(10, CGRectGetMaxY(_avatarImageView.frame) + 5, CGRectGetWidth(self.bounds) - 20, imageHeight);
    _avatarImageView.layer.cornerRadius = CGRectGetWidth(_avatarImageView.frame)/2;
}
@end
