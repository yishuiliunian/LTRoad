//
//  LTCarMeetMenuView.m
//  LuTu
//
//  Created by stonedong on 15/4/16.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTCarMeetMenuView.h"
#import "LTGlobals.h"
@implementation LTCarMeetMenuView
- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SELF_SUBVIEW_UILabel(_detailTextLabel);
    INIT_SUBVIEW_UIButton(self, _interButton);
    //
    [_interButton setTitle:@"进入主页" forState:UIControlStateNormal];
    _detailTextLabel.numberOfLines = 0;
    ColorLabelWithWhite(_detailTextLabel);
    _interButton.layer.borderColor = [UIColor whiteColor].CGColor;
    _interButton.layer.borderWidth = 1;
    _interButton.layer.cornerRadius = 3;
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    _interButton.frame = CGRectMake(10, CGRectGetHeight(self.bounds) - 25, 80, 25);
    _detailTextLabel.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds) - 20, CGRectGetHeight(self.bounds) - CGRectGetMinY(_interButton.frame) - 5);
}
@end
