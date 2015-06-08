//
//  LTGrowImageView.m
//  LuTu
//
//  Created by stonedong on 15/6/8.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTGrowImageView.h"
#import "LKHaneke.h"
#import <DZImageCache.h>
@interface LTGrowImageView ()
{
    BOOL _needUpdateAdjustHeight;
}
@end

@implementation LTGrowImageView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    _needUpdateAdjustHeight = YES;
    _adjustImageSize = CGSizeMake(0, 0);
    self.layer.masksToBounds = YES;
    return self;
}

- (void) setImage:(UIImage *)image
{
    [super setImage:image];
    _needUpdateAdjustHeight = YES;
    [self setNeedsLayout];
}


- (void) layoutSubviews
{
    [super layoutSubviews];
    if (_needUpdateAdjustHeight) {
        if (!self.image || [self.image isEqual:DZCachedImageByName(kPlaceHolderImageName)]) {
            self.adjustHeight = 0;
        } else {
            self.adjustHeight = self.image.size.height /2;
        }
        _needUpdateAdjustHeight = NO;
    }
}

@end
