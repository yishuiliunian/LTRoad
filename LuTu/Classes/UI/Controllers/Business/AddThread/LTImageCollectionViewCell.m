//
//  LTImageCollectionViewCell.m
//  LuTu
//
//  Created by stonedong on 15/7/11.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTImageCollectionViewCell.h"
#import "LKHaneke.h"
@implementation LTImageCollectionViewCell
- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SUBVIEW(self.contentView, UIImageView, _imageView);
    _imageView.hnk_cacheFormat = LTHanekeCacheFormatAvatar();
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    _imageView.frame = self.bounds;
}
@end
