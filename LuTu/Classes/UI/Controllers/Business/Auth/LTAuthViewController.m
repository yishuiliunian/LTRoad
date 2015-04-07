//
//  LTAuthViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTAuthViewController.h"
#import <DZProgramDefines.h>
#import "LTBackgroundImageView.h"

@interface LTAuthViewController ()
DEFINE_PROPERTY_STRONG_READONLY(LTBackgroundImageView*, backgroudImageView);
DEFINE_PROPERTY_STRONG_READONLY(UIButton*, wechatBtn);
DEFINE_PROPERTY_STRONG_READONLY(UIButton*, qqBtn);
DEFINE_PROPERTY_STRONG_READONLY(UIButton*, weboBtn);
@end

@implementation LTAuthViewController
- (void) viewDidLoad
{
    [super viewDidLoad];
}

- (void) initSubViews
{
    INIT_SUBVIEW(self.view, LTBackgroundImageView, _backgroudImageView);
    INIT_SUBVIEW(self.view, UIButton, _wechatBtn);
    INIT_SUBVIEW(self.view, UIButton, _qqBtn);
    INIT_SUBVIEW(self.view, UIButton, _weboBtn);
}
@end
