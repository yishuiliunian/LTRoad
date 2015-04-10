//
//  LTLikeButton.m
//  LuTu
//
//  Created by stonedong on 15/4/8.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTLikeButton.h"

@implementation LTLikeButton
- (void) layoutSubviews
{
    [super layoutSubviews];
    CGFloat height = CGRectGetHeight(self.bounds);
    CGSize imageSize = CGSizeMake(height, height);
    self.imageView.frame = CGRectMake(0, 0, imageSize.width, imageSize.height);
    CGFloat imageStartX = CGRectGetMaxX(self.imageView.frame);
    self.titleLabel.frame = CGRectMake(imageStartX, 0, CGRectGetWidth(self.bounds), height);
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
}
@end
