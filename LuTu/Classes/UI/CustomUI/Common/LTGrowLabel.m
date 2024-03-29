//
//  LTGrowLabel.m
//  LuTu
//
//  Created by stonedong on 15/5/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTGrowLabel.h"
#import "AdjustFrame.h"


@interface LTGrowLabel ()
{
    BOOL _needUpdateTextHeight;
}
@end
@implementation LTGrowLabel

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    _needUpdateTextHeight = YES;
    self.numberOfLines = 0;
    return self;
}
- (void) setText:(NSString *)text
{
    [super setText:text];
    _needUpdateTextHeight = YES;
}
- (void) setFont:(UIFont *)font
{
    [super setFont:font];
    _needUpdateTextHeight = YES;
}
- (void) setFrame:(CGRect)frame
{
    [super setFrame:frame];
    _needUpdateTextHeight = YES;
}
- (void) layoutSubviews
{
    [super layoutSubviews];
    if (_needUpdateTextHeight) {
        if (self.text) {
            CGSize size = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(CGRectGetWidth(self.bounds), 10000)];
            self.adjustHeight= size.height + 15;
        } else {
            self.adjustHeight = CGRectGetHeight(self.bounds);
        }
        _needUpdateTextHeight = NO;
    }
}

@end
