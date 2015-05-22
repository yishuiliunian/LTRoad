//
//  LTLineHeaderView.m
//  LuTu
//
//  Created by stonedong on 15/4/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTLineHeaderView.h"

#import <DZProgramDefines.h>
#import <Masonry.h>
#import "LTGlobals.h"
const CGFloat  LTLineHeaderCellHeight =410;

@interface LTLineHeaderView ()
{
    UIView* _lineView;
}
@end
@implementation  LTLineHeaderView
- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SELF_SUBVIEW(UIView, _lineView);
    INIT_SUBVIEW(self, BMKMapView, _mapView);
    _mapView.backgroundColor = [UIColor redColor];
    INIT_SELF_SUBVIEW(LTShowContentView, _detailContentView);
    INIT_SELF_SUBVIEW(LTLineStartEndView, _startEndView);
    
    _lineView.backgroundColor = LTColorGrayNormal();
    
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    _mapView.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), 250);
    CGFloat xOffset = 10;
    CGFloat yOffset = 10;
    CGFloat width = CGRectGetWidth(self.bounds) - xOffset * 2;
    CGFloat detailContentViewHeight = 60;
    _startEndView.frame = CGRectMake(xOffset, CGRectGetMaxY(_mapView.frame) + yOffset, width, LTLinePointViewHeight);
    _detailContentView.frame = CGRectMake( xOffset, CGRectGetMaxY(_startEndView.frame) + yOffset * 2, width, detailContentViewHeight);
    
    //
    _lineView.frame = CGRectMake(0, CGRectGetMaxY(_startEndView.frame) + 10, CGRectGetWidth(self.bounds), 1);
}
@end
