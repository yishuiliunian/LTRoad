//
//  LTShowContentView.m
//  LuTu
//
//  Created by stonedong on 15/4/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTShowContentView.h"
#import <DZProgramDefines.h>

@interface LTShowContentView ()
{
    UIImageView* _line1;
    UIImageView* _line2;
    UIImageView* _line3;
}
@end

@implementation LTShowContentView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SELF_SUBVIEW(LTTopShowTextView, _roadStatusView);
    INIT_SELF_SUBVIEW(LTTopShowTextView, _timeView);
    INIT_SELF_SUBVIEW(LTTopShowTextView, _distanceView);
    INIT_SELF_SUBVIEW(LTTopShowImageView, _carStyleView);
    
    _roadStatusView.detailLabel.text  = @"路况";
    _timeView.detailLabel.text = @"时间";
    _distanceView.detailLabel.text = @"Km";
    _carStyleView.detailLabel.text = @"轿车";
    //
    INIT_SELF_SUBVIEW_UIImageView(_line1);
    INIT_SELF_SUBVIEW_UIImageView(_line2);
    INIT_SELF_SUBVIEW_UIImageView(_line3);
    
    void(^ConfigureLine)(UIView* v) = ^(UIView* v) {
        v.backgroundColor = [UIColor lightGrayColor];
    };
    ConfigureLine(_line1);
    ConfigureLine(_line3);
    ConfigureLine(_line2);
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat itemSpace = 10;
    CGFloat itemWidth = (CGRectGetWidth(self.bounds) - itemSpace*3 ) /4;
    CGFloat itemHegth = CGRectGetHeight(self.bounds);
    _timeView.frame = CGRectMake(0, 0, itemWidth, itemHegth);
    _carStyleView.frame = CGRectOffset(_timeView.frame, itemWidth + itemSpace, 0 );
    _distanceView.frame = CGRectOffset(_carStyleView.frame, itemWidth + itemSpace, 0);
    _roadStatusView.frame = CGRectOffset(_distanceView.frame, itemWidth + itemSpace, 0);
    //
    CGRect  (^ItemSpaceLineRect)(UIView* leftView, UIView* rightView) = ^(UIView* leftView, UIView* rightView) {
        
        CGRect rect;
        CGFloat width = 1;
        rect.origin.y = CGRectGetMinY(leftView.frame);
        rect.origin.x = CGRectGetMaxX(leftView.frame) + ((CGRectGetMinX(rightView.frame) - CGRectGetMaxX(leftView.frame)) - width ) / 2;
        rect.size.width = width;
        rect.size.height = CGRectGetHeight(leftView.frame);
        return  rect;
    };
    
    _line1.frame = ItemSpaceLineRect(_timeView, _carStyleView);
    _line2.frame = ItemSpaceLineRect(_carStyleView, _distanceView);
    _line3.frame = ItemSpaceLineRect(_distanceView, _roadStatusView);
}


@end
