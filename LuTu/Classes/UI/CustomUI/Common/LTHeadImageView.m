//
//  LTHeadImageView.m
//  LuTu
//
//  Created by stonedong on 15/5/16.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTHeadImageView.h"
#import "LKHaneke.h"
@implementation LTHeadImageView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    self.hnk_cacheFormat = LTHanekeCacheFormatAvatar();
    self.layer.masksToBounds = YES;
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    self.layer.cornerRadius = CGRectGetHeight(self.bounds) / 2;
    NSAssert((CGRectGetHeight(self.bounds) - CGRectGetWidth(self.bounds) < 2), @"头像的展示View不是一个正方形，请修正他");
}

@end
