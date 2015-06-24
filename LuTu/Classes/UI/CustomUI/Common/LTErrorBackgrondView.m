//
//  LTErrorBackgrondView.m
//  LuTu
//
//  Created by stonedong on 15/6/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTErrorBackgrondView.h"
#import <DZProgramDefines.h>
#import <DZGeometryTools.h>
#import <DZImageCache.h>
#import "LTGlobals.h"
@interface LTErrorBackgrondView()
DEFINE_PROPERTY_STRONG_UIImageView(indicatorImageView);
DEFINE_PROPERTY_STRONG_UILabel(indicatorLabel);
@end
@implementation LTErrorBackgrondView
- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SELF_SUBVIEW_UIImageView(_indicatorImageView);
    INIT_SELF_SUBVIEW_UILabel(_indicatorLabel);
    _indicatorLabel.textAlignment = NSTextAlignmentCenter;
    _indicatorLabel.textColor = LTColorDetailGray();
    _indicatorImageView.image = DZCachedImageByName(@"null_blank");
    return self;
}

- (void) setMessage:(NSString *)message
{
    _message = message;
    _indicatorLabel.text = _message;
}
- (void) layoutSubviews
{
    [super layoutSubviews];
    _indicatorImageView.frame =  CGRectCenter(self.bounds, CGSizeMake(200, 150));
    _indicatorLabel.frame = CGRectMake(0, CGRectGetMaxY(_indicatorImageView.frame)+10, CGRectGetWidth(self.bounds), 40);
}
@end
