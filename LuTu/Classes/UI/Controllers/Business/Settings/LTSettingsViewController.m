//
//  LTSettingsViewController.m
//  LuTu
//
//  Created by stonedong on 15/6/7.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTSettingsViewController.h"
#import <DZProgramDefines.h>
#import <DZGeometryTools.h>
#import "LTColors.h"
#import "LTAccountManager.h"
@interface LTButtonContainerView : UIView
DEFINE_PROPERTY_STRONG_UIButton(button);
@end

@implementation LTButtonContainerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        INIT_SUBVIEW_UIButton(self, _button);
    }
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    
    CGRect buttonRect = CGRectCenterSubSize(self.bounds, CGSizeMake(20, 0));
    buttonRect.origin.y = CGRectHeightOffsetCenter(buttonRect, 44);
    buttonRect.size.height = 44;
    _button.frame = buttonRect;
}


@end

@interface LTSettingsViewController ()

@end

@implementation LTSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.showCreditsFooter = NO;               // 不显示底部Credits
    self.showDoneButton = NO;
    
    
    LTButtonContainerView* btnContainer = [LTButtonContainerView new];
    btnContainer.frame = CGRectMake(0, 0, CGRectGetViewControllerWidth, 80);
    
    [btnContainer.button setTitle:@"退出" forState:UIControlStateNormal];
    btnContainer.button.layer.cornerRadius = 5;
    btnContainer.button.layer.borderWidth = 1;
    self.tableView.tableFooterView = btnContainer;
    
    [btnContainer.button addTarget:self action:@selector(exit) forControlEvents:UIControlEventTouchUpInside];
}

- (void) exit
{
    [LTShareAccountManager reloadAccount:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
