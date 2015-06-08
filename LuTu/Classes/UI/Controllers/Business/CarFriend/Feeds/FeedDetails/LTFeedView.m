//
//  LTFeedView.m
//  LuTu
//
//  Created by stonedong on 15/5/16.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTFeedView.h"
#import "LTGlobals.h"
@interface LTFeedView ()
{
    UIView* _lineView;
}
@end

@implementation LTFeedView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SELF_SUBVIEW(LTFeedContentView, _feedContentView);
    INIT_SELF_SUBVIEW(LTFeedHeadView, _feedHeaderView);
    INIT_SELF_SUBVIEW(LTTopicHeadView, _topicHeaderView);
    INIT_SELF_SUBVIEW(UIView, _lineView);
    _lineView.backgroundColor = LTColorDetailGray();
    return self;
}


- (void) handleAdjustFrame
{
    self.adjustHeight = _feedHeaderView.adjustHeight + 80 + _feedContentView.adjustHeight;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    _feedHeaderView.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), _feedHeaderView.adjustHeight);
    _lineView.frame = CGRectMake(LTLayoutXOffset, CGRectGetMaxY(_feedHeaderView.frame), CGRectGetWidth(self.bounds) - LTLayoutXOffset*2, 1);
    [self bringSubviewToFront:_lineView];
    _topicHeaderView.frame = CGRectMake(0, CGRectGetMaxY(_feedHeaderView.frame), CGRectGetWidth(self.bounds), 80);
    _feedContentView.frame = CGRectMake(0, CGRectGetMaxY(_topicHeaderView.frame), CGRectGetWidth(self.bounds), _feedContentView.adjustHeight);
}
@end
