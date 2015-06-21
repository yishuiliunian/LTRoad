//
//  LTTopicHeadView.m
//  LuTu
//
//  Created by stonedong on 15/5/16.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTTopicHeadView.h"

#import "LTGlobals.h"
@implementation LTTopicHeadView

- (instancetype) initWithFrame:(CGRect)frame
{
    self  = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    
    INIT_SELF_SUBVIEW(LTHeadImageView, _avatarImageView);
    INIT_SELF_SUBVIEW_UILabel(_nickLabel);
    INIT_SELF_SUBVIEW_UILabel(_timeLabel);
    INIT_SELF_SUBVIEW_UILabel(_roleLabel);
    
    _timeLabel.textColor = LTColorDetailGray();
    _roleLabel.textColor = LTColorDetailGray();
    return self;
}
- (CGFloat) height
{
    return 80;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    CGRect contentRect = self.bounds;
    contentRect = CGRectCenterSubSize(self.bounds, CGSizeMake(LTLayoutXOffset*2, LTLayoutYOffset*2));
    CGRect avatarRect;
    CGRect textContentRect;
    
    CGRectDivide(contentRect, &avatarRect, &textContentRect, CGRectGetHeight(contentRect), CGRectMinXEdge);
    
    textContentRect.origin.x += LTLayoutXOffset;
    textContentRect.size.width -= LTLayoutXOffset;
    
    CGRect topRect;
    CGRect bottomRect;
    CGRectDivide(textContentRect, &topRect, &bottomRect, CGRectGetHeight(textContentRect) / 2, CGRectMinYEdge);
    
    CGRect nickRect;
    CGRect roleRect;
    
    CGRectDivide(topRect, &roleRect, &nickRect, 50, CGRectMaxXEdge);
    
    _avatarImageView.frame = avatarRect;
    _nickLabel.frame = nickRect;
    _roleLabel.frame = roleRect;
    _timeLabel.frame = bottomRect;
}
@end
