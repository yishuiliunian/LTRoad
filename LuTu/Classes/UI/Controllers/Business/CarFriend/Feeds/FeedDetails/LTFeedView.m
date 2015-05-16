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
- (void) dealloc
{
    REMOVE_OBSERVER_TO_HEIGHT(_feedContentView);
    REMOVE_OBSERVER_TO_HEIGHT(_feedHeaderView);
}
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
    ADD_OBSERVER_TO_HEIGHT(_feedContentView);
    ADD_OBSERVER_TO_HEIGHT(_feedHeaderView);
    _height = [self calculateHeight];
    return self;
}

FILL_CALCULATE_HEIGHT_FUNC
{
    CGFloat height = _feedHeaderView.height +  _feedContentView.height + _topicHeaderView.height;
    return height;
}
- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    HANDLE_HEIGHT_CHANGED_FOR_VIEW(_feedHeaderView);
    HANDLE_HEIGHT_CHANGED_FOR_VIEW(_feedContentView);
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    _feedHeaderView.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), _feedHeaderView.height);
    _lineView.frame = CGRectMake(LTLayoutXOffset, CGRectGetMaxY(_feedHeaderView.frame), CGRectGetWidth(self.bounds) - LTLayoutXOffset*2, 1);
    [self bringSubviewToFront:_lineView];
    _topicHeaderView.frame = CGRectMake(0, CGRectGetMaxY(_feedHeaderView.frame), CGRectGetWidth(self.bounds), _topicHeaderView.height);
    _feedContentView.frame = CGRectMake(0, CGRectGetMaxY(_topicHeaderView.frame), CGRectGetWidth(self.bounds), _feedContentView.height);
}
@end
