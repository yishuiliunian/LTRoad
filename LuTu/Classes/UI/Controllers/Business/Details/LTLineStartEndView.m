//
//  LTLineStartEndView.m
//  LuTu
//
//  Created by stonedong on 15/4/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTLineStartEndView.h"
#import <DZProgramDefines.h>
#import <DZGeometryTools.h>
#import "LTColors.h"

 CGFloat const LTLinePointViewHeight = 60;
@interface LTLineStartEndView ()
{
    UIView* _centerLineView;
}
@end
@implementation LTLineStartEndView
- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SELF_SUBVIEW(UIView, _centerLineView);
    INIT_SELF_SUBVIEW(LTLinePointView, _startPointView);
    INIT_SELF_SUBVIEW(LTLinePointView, _endPointView);
    
    _centerLineView.backgroundColor = LTColorGrayNormal();
    //
    _startPointView.titleLabel.text = @"起点";
    _endPointView.titleLabel.text  = @"终点";
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    _startPointView.frame = CGRectMake(0, 0, 100, CGRectGetHeight(self.bounds));
    _endPointView.frame = CGRectMake(CGRectGetWidth(self.bounds) - 100, 0, 100, CGRectGetHeight(self.bounds));
    [_startPointView layoutIfNeeded];
    [_endPointView layoutIfNeeded];
    
    CGPoint startPoint = [self convertPoint:_startPointView.pointView.center fromView:_startPointView];
    CGPoint endPoint = [self convertPoint:_endPointView.pointView.center fromView:_endPointView];
    
    CGFloat lineHeight = 4;
    CGRect lineRect = CGRectZero;
    lineRect.origin.x = startPoint.x;
    lineRect.origin.y = startPoint.y - lineHeight / 2;
    lineRect.size.width = endPoint.x - startPoint.x;
    lineRect.size.height = lineHeight;
    _centerLineView.frame = lineRect;
}
@end
