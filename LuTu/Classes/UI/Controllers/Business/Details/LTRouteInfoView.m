//
//  LTRouteInfoView.m
//  LuTu
//
//  Created by stonedong on 15/5/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTRouteInfoView.h"
#import <DZGeometryTools.h>
#import "AdjustFrame.h"
#import "LTGlobals.h"
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
DEFINE_PROPERTY_STRONG_UIImageView(backgroundView);
@end
@implementation LTRouteInfoView
- (void) dealloc
{
}
- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SELF_SUBVIEW_UIImageView(_backgroundView);
    INIT_SELF_SUBVIEW_UILabel(_indicatorLabel);
    INIT_SELF_SUBVIEW(LTGrowLabel, _detailLabel);
    INIT_SUBVIEW_UIButton(self, _actionButton);
    INIT_SELF_SUBVIEW_UIImageView(_lineView);
    INIT_SELF_SUBVIEW(LTBadgeContentView, _badgeContentView);
    _state = LTRouteInfoViewStateOpen;
    //
    _xOffset = 15;
    _yOffSet = 10;
    _topHeight = 50;
    _bottomHeight = 40;
    _textHeight = 0;
    //
    
    _indicatorLabel.text = @"线路详情";
    _lineView.backgroundColor = LTColorGrayBC();
    
    //
    _needUpdateHeight = YES;
    //
    _backgroundView.backgroundColor = [UIColor whiteColor];
    _backgroundView.layer.cornerRadius = 5;
    return self;
}



- (void) handleAdjustFrame
{
    CGFloat height = _yOffSet * 4 + _topHeight + _bottomHeight + _detailLabel.adjustHeight;
    self.adjustHeight = height;
    CGRect rect = self.bounds;
    rect.size.height = height;
    self.frame = rect;
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
    CGRect rect = self.bounds;
    if (_needUpdateHeight) {
        rect.size.height = [self calHeight];
        _needUpdateHeight = NO;
    }
    CGRect backgroudRect = CGRectCenterSubSize(rect, CGSizeMake(_xOffset*2, _yOffSet*2));
    CGRect contentRect = CGRectCenterSubSize(backgroudRect, CGSizeMake(_xOffset*2, _yOffSet));
    CGRect topRect;
    CGRect textRect;
    CGRect bottomRect;
    
    CGRectDivide(contentRect, &topRect, &textRect, _topHeight, CGRectMinYEdge);
    CGRectDivide(textRect, &bottomRect, &textRect, _bottomHeight, CGRectMaxYEdge);
    textRect = CGRectCenterSubSize(textRect, CGSizeMake(0, _yOffSet));
    
    CGSize buttonSize = CGSizeMake(30, 30);
    CGRect indicatorRect;
    CGRect buttonRect;
    
    CGRectDivide(topRect, &indicatorRect, &buttonRect, buttonSize.width, CGRectMaxXEdge);
    indicatorRect = CGRectShrink(buttonRect, _xOffset, CGRectMaxXEdge);
    
    _indicatorLabel.frame = indicatorRect;
    _lineView.frame = CGRectMake(CGRectGetMinX(contentRect), CGRectGetMaxY(topRect), CGRectGetWidth(contentRect) , 1);
    _actionButton.frame = buttonRect;
    _detailLabel.frame = textRect;
    _backgroundView.frame = backgroudRect;
    _badgeContentView.frame = bottomRect;
}

- (BOOL) hintAdjustSupreView
{
    return YES;
}

@end
