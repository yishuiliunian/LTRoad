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
    CGFloat _textHeight;
    CGFloat _imageHeight;
}
@end
@implementation LTFeedContentView
- (void) dealloc
{
    [_contentLabel removeObserver:self forKeyPath:@"text"];
}
- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SELF_SUBVIEW_UIImageView(_imageView);
    INIT_SELF_SUBVIEW_UILabel(_contentLabel);
    _textHeight = 20;
    _imageHeight = 100;
    //
    _contentLabel.font = LTFontDetail();
    _contentLabel.numberOfLines = 0;
    _contentLabel.textAlignment = NSTextAlignmentCenter;
    //
    [_contentLabel addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    _height = [self calculateHeight];
    _imageView.frame = CGRectMake(0, 0, 2, 2);
    return self;
}
FILL_CALCULATE_HEIGHT_FUNC
{
    return _textHeight + LTLayoutYOffset*3 + _imageHeight;
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == _contentLabel && [keyPath isEqualToString:@"text"]) {
        NSString* text = change[NSKeyValueChangeNewKey];
        UIFont* font = _contentLabel.font;
        CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake(LTFeedContentWidth(), 100000)];
        _textHeight = size.height;
        self.height = [self calculateHeight];
    }
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    CGRect contentRect = CGRectCenterSubSize(self.bounds, CGSizeMake(LTLayoutXOffset*2, LTLayoutYOffset*2));
    
    CGRect imageRect;
    CGRect textRect;
    
    CGRectDivide(contentRect, &imageRect, &textRect, _imageHeight, CGRectMinYEdge);
    textRect = CGRectShrink(textRect, LTLayoutYOffset, CGRectMinYEdge);
    
    _imageView.frame = imageRect;
    _contentLabel.frame = textRect;
}
@end
