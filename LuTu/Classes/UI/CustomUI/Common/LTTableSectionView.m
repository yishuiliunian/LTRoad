//
//  LTTableSectionView.m
//  LuTu
//
//  Created by stonedong on 15/6/7.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTTableSectionView.h"
#import <DZProgramDefines.h>
#import <DZGeometryTools.h>
@interface LTTableSectionView()

@end
@implementation LTTableSectionView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SELF_SUBVIEW_UILabel(_textLabel);
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    _textLabel.frame =  CGRectCenterSubSize(self.bounds, CGSizeMake(10, 10));
}

@end
