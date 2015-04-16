//
//  LTBackButton.m
//  LuTu
//
//  Created by stonedong on 15/4/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTBackButton.h"
@interface LTBackButton()
{
    UIImageView* _backgroundImageView;
}
@end
@implementation LTBackButton
- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    _backgroundImageView = [UIImageView new];
    [self insertSubview:_backgroundImageView atIndex:0];
    _backgroundImageView.backgroundColor = [UIColor blackColor];
    _backgroundImageView.alpha = 6;
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    _backgroundImageView.frame = self.bounds;
}
@end
