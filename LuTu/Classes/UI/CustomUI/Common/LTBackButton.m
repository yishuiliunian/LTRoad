//
//  LTBackButton.m
//  LuTu
//
//  Created by stonedong on 15/4/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTBackButton.h"
#import <DZGeometryTools.h>
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
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.imageView.contentMode = UIViewContentModeCenter;
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    _backgroundImageView.frame = self.bounds;
    CGRect imageRect;
    CGRect titleRect;
    
    CGRectDivide(self.bounds, &imageRect, &titleRect, CGRectGetHeight(self.bounds)/2, CGRectMinYEdge);
    CGFloat imageWidth = MIN(CGRectGetWidth(imageRect), CGRectGetHeight(imageRect));
    self.imageView.frame = imageRect;
    self.titleLabel.frame = CGRectCenterSubSize(titleRect, CGSizeMake(20, 0));
    
    [self bringSubviewToFront:self.imageView];
}
@end
