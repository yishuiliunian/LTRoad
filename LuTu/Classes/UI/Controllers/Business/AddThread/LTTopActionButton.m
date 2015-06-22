//
//  LTTopActionButton.m
//  LuTu
//
//  Created by stonedong on 15/6/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTTopActionButton.h"
#import <DZGeometryTools.h>
#import <DZImageCache.h>
@interface LTTopActionButton()
{
}
@property (nonatomic, weak) id<LTToggleActionProtocol> target;
@end
@implementation LTTopActionButton

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    _isAction = NO;
    [self addTarget:self action:@selector(toggleAction) forControlEvents:UIControlEventTouchUpInside];
    [self showIndicator];
    return self;
}

- (void) toggleAction
{
    _isAction = !_isAction;
    [self showIndicator];
    if ([_target respondsToSelector:@selector(toggleActionButton:)]) {
        [_target toggleActionButton:self];
    }
}

- (void) setIsAction:(BOOL)isAction
{
    _isAction = isAction;
    [self showIndicator];
}
- (void) addToggleActionTarget:(id<LTToggleActionProtocol>)target
{
    _target = target;
}
- (void) layoutSubviews
{
    [super layoutSubviews];
    CGRect textRect;
    CGRect imageRect;
    
    CGSize size = [self.currentTitle sizeWithFont:self.titleLabel.font constrainedToSize:CGSizeMake(10000, 100000)];
    if (size.width > CGRectGetWidth(self.bounds) - 50) {
        size.width = CGRectGetWidth(self.bounds) - 50;
    }
    
    CGFloat startX = CGRectWidthOffsetCenter(self.bounds, size.width);
    textRect.origin.x = startX;
    textRect.origin.y = 0;
    textRect.size.width = size.width;
    textRect.size.height = CGRectGetHeight(self.bounds);
    
    CGFloat imageHeight = 20;
    imageRect.origin.x = CGRectGetMaxX(textRect) + 5;
    imageRect.origin.y = (CGRectGetHeight(self.bounds) - imageHeight) / 2 +2;
    imageRect.size.width = imageHeight;
    imageRect.size.height = imageHeight;
    
    self.titleLabel.frame = textRect;
    self.imageView.frame = imageRect;
}

- (void) showIndicator
{
    if (_isAction) {
        [self setImage:DZCachedImageByName(@"arrow_down") forState:UIControlStateNormal];
    } else {
        [self setImage:DZCachedImageByName(@"road_arrow_up") forState:UIControlStateNormal];
    }
}
@end
