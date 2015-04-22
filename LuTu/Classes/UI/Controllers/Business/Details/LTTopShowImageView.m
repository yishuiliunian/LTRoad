//
//  LTTopShowImageView.m
//  LuTu
//
//  Created by stonedong on 15/4/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTTopShowImageView.h"

@implementation LTTopShowImageView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    _imageView = [UIImageView new];
    [self addSubview:_imageView];
    _topView = _imageView;
    return self;
}

@end
