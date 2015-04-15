//
//  LTNavigationBar.m
//  LuTu
//
//  Created by stonedong on 15/4/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTNavigationBar.h"
#import <DZImageCache.h>
#import <DZProgramDefines.h>
@interface LTNavigationBar ()
{
    UIImageView* _logoImageView;
}
@end
@implementation LTNavigationBar

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SELF_SUBVIEW_UIImageView(_logoImageView);
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
}

@end
