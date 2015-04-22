//
//  LTLinePointView.m
//  LuTu
//
//  Created by stonedong on 15/4/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTLinePointView.h"
#import <DZProgramDefines.h>
#import <DZGeometryTools.h>
#import "LTColors.h"
#import "LTGlobals.h"

@implementation LTPointView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    _color = LTColorPointGray();
    return self;
}

- (void) drawRect:(CGRect)rect
{
    UIBezierPath* bigCircle = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    [_color setStroke];
    [_color setFill];
    [bigCircle fill];
    
    CGRect little = CGRectOfCenterForContainsSize(self.bounds, CGSizeMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)/2));
    UIBezierPath* littleCircle = [UIBezierPath bezierPathWithOvalInRect:little];
    UIColor* whiteColor = [UIColor whiteColor];
    [whiteColor setStroke];
    [whiteColor setFill];
    [littleCircle fill];
}

@end




@implementation LTLinePointView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SELF_SUBVIEW_UILabel(_titleLabel);
    INIT_SELF_SUBVIEW_UILabel(_detailLabel);
    INIT_SELF_SUBVIEW_UIImageView(_imageView);
    INIT_SELF_SUBVIEW(LTPointView,_pointView);
    //
    _titleLabel.textColor = LTColorGrayNormal();
    _titleLabel.font = LTFontDetail();
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    _pointView.frame = CGRectMake(0, 0, 20, 20);
    _titleLabel.frame = CGRectMake(0, CGRectGetMaxY(_pointView.frame), 40, 20);
    _imageView.frame = CGRectMake(CGRectGetMaxX(_titleLabel.frame) + 5, 0, 20, 20);
    _detailLabel.frame = CGRectMake(0, CGRectGetMaxY(_titleLabel.frame), 100, 20);
}

@end