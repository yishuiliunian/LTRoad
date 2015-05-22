//
//  LTRouteInfoView.m
//  LuTu
//
//  Created by stonedong on 15/5/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTRouteInfoView.h"
#import <DZGeometryTools.h>
typedef enum {
    LTRouteInfoViewStateOpen,
    LTRouteInfoViewStateClose
}LTRouteInfoViewState;

@interface LTRouteInfoView ()
{
    LTRouteInfoViewState _state;
    CGFloat _xOffset;
    CGFloat _yOffSet;
    
    CGFloat _topHeight;
    CGFloat _bottomHeight;
    
    CGFloat _textHeight;
    
    BOOL _needUpdateHeight;
}
DEFINE_PROPERTY_STRONG_UILabel(indicatorLabel);
DEFINE_PROPERTY_STRONG_UIButton(actionButton);
DEFINE_PROPERTY_STRONG_UIImageView(lineView);
@end
@implementation LTRouteInfoView
- (void) dealloc
{
    [_detailLabel removeObserver:self forKeyPath:@"textHeight"];
}
- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SELF_SUBVIEW_UILabel(_indicatorLabel);
    INIT_SELF_SUBVIEW(LTGrowLabel, _detailLabel);
    INIT_SUBVIEW_UIButton(self, _actionButton);
    INIT_SELF_SUBVIEW(LTBadgeContentView, _badgeContentView);
    _state = LTRouteInfoViewStateOpen;
    //
    _xOffset = 15;
    _yOffSet = 10;
    _topHeight = 30;
    _bottomHeight = 40;
    _textHeight = 0;
    //
    [_detailLabel addObserver:self forKeyPath:@"textHeight" options:NSKeyValueObservingOptionNew context:nil];
    return self;
}
- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == _detailLabel && [keyPath isEqualToString:@"textHeight"]) {
        [self updateHeight];
    }
}


- (void) updateHeight
{
    _textHeight = _detailLabel.textHeight;
    self.height = [self calHeight];
}

- (CGFloat) calHeight
{
    if (_textHeight < 1) {
        return _yOffSet* 3 + _bottomHeight + _topHeight;
    } else {
        return _yOffSet*4 + _bottomHeight + _topHeight;
    }
}
- (void) layoutSubviews
{
    [super layoutSubviews];
    
    CGRect contentRect = CGRectCenterSubSize(self.bounds, CGSizeMake(_xOffset*2, _yOffSet*2));
    CGRect topRect;
    CGRect textRect;
    CGRect bottomRect;
    
    CGRectDivide(contentRect, &topRect, &textRect, _topHeight, CGRectMinYEdge);
    CGRectDivide(textRect, &bottomRect, &textRect, _bottomHeight, CGRectMaxYEdge);
    textRect = CGRectCenterSubSize(textRect, CGSizeMake(0, _yOffSet*2));
    
    CGSize buttonSize = CGSizeMake(30, 30);
    CGRect indicatorRect;
    CGRect buttonRect;
    
    CGRectDivide(topRect, &buttonRect, &indicatorRect, buttonSize.width, CGRectMaxXEdge);
    indicatorRect = CGRectShrink(buttonRect, _xOffset, CGRectMaxXEdge);
    
    _indicatorLabel.frame = indicatorRect;
    _actionButton.frame = buttonRect;
    _detailLabel.frame = textRect;
    _badgeContentView.frame = bottomRect;
}

@end
