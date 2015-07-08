//
//  LTFeedContentView.m
//  LuTu
//
//  Created by stonedong on 15/5/16.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTFeedContentView.h"
#import "LTGlobals.h"
@interface LTFeedContentView()
{
    CGFloat _imageHeight;
}
@end
@implementation LTFeedContentView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SELF_SUBVIEW(LTGrowImageView,_imageView);
    INIT_SELF_SUBVIEW(LTGrowLabel,_contentLabel);
    //
    _contentLabel.font = LTFontDetail();
    _contentLabel.numberOfLines = 0;
    _contentLabel.textAlignment = NSTextAlignmentLeft;
    //
    _imageView.adjustImageSize = CGSizeMake(CGCurrentScreenSize().width - 20, 100);
    _imageView.hnk_cacheFormat = LTHanekeCacheFormatFeedBackground();
    return self;
}
- (void) handleAdjustFrame
{
    if (_imageView.adjustHeight < 0.1) {
        self.adjustHeight = _contentLabel.adjustHeight + LTLayoutYOffset*2 + _imageView.adjustHeight;
    } else {
        self.adjustHeight = _contentLabel.adjustHeight + LTLayoutYOffset*3 + _imageView.adjustHeight;
    }
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    CGRect contentRect = CGRectCenterSubSize(self.bounds, CGSizeMake(LTLayoutXOffset*2, LTLayoutYOffset*2));
    
    CGRect imageRect;
    CGRect textRect;
    
    CGRectDivide(contentRect, &imageRect, &textRect, _imageView.adjustHeight, CGRectMinYEdge);
    if (_imageView.adjustHeight > 1) {
        textRect = CGRectShrink(textRect, LTLayoutYOffset, CGRectMinYEdge);
    }
    
    _imageView.frame = imageRect;
    _contentLabel.frame = textRect;
}
@end
