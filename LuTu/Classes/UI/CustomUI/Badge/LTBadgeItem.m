//
//  LTBadgeItem.m
//  LuTu
//
//  Created by stonedong on 15/4/8.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTBadgeItem.h"
#import <UIKit/UIKit.h>
#import "LTFont.h"
@implementation LTBadgeItem
- (instancetype) initWithText:(NSString *)text
{
    self = [self init];
    if (!self) {
        return self;
    }
    [self setText:text];

    return self;
}
- (instancetype) init
{
    self = [super init];
    if (!self) {
        return self;
    }
    _xOffset = 5;
    _yOffset = 5;
    return self;
}

- (void) setText:(NSString *)text
{
    if (_text != text) {
        _text = text;
        [self calculateWith];
    }
}

- (void) calculateWith
{
    CGSize size  = [_text sizeWithFont:LTFontTag() constrainedToSize:CGSizeMake(1000, 10000)];
    _width = size.width + _xOffset*2;
    _height = size.height + _yOffset*2;
    
}
@end
