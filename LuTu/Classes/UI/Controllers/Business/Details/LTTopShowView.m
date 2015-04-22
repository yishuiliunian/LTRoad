//
//  LTTopShowView.m
//  LuTu
//
//  Created by stonedong on 15/4/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTTopShowView.h"
#import <Masonry.h>
#import <DZProgramDefines.h>
#import "LTColors.h"
#import "LTGlobals.h"
@interface LTTopShowView ()
{
}
@end
@implementation LTTopShowView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    
    INIT_SELF_SUBVIEW_UILabel(_detailLabel);
    _detailLabel.textColor = LTColorGrayNormal();
    _detailLabel.textAlignment = NSTextAlignmentCenter;
    _detailLabel.font = LTFontDetail();
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    CGFloat yOffset = 5;
    CGFloat xOffset = 10;
    CGFloat detailHeight = 15;
    CGFloat topHeight = CGRectGetHeight(self.bounds) - yOffset * 2 - detailHeight;
    CGFloat startX = xOffset;
    CGFloat width = CGRectGetWidth(self.bounds) - xOffset * 2;
    _topView.frame = CGRectMake(startX, yOffset, width, topHeight);
    _detailLabel.frame = CGRectMake(startX, CGRectGetMaxY(_topView.frame) + yOffset, width, detailHeight);
    
}

@end
