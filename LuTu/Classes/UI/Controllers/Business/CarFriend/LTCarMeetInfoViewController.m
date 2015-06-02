//
//  LTCarMeetInfoViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTCarMeetInfoViewController.h"
#import <DZGeometryTools.h>
@interface LTCarMeetInfoViewController ()
{
    UITextView* _textView;
}
@end

@implementation LTCarMeetInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _textView = [UITextView new];
    [self.view addSubview:_textView];
    _textView.backgroundColor = [UIColor whiteColor];
    _textView.layer.cornerRadius = 5;
    _textView.text = self.introText;
}

- (void) setIntroText:(NSString *)introText
{
    _introText = introText;
    _textView.text = introText;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void) viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _textView.frame = CGRectCenterSubSize(self.view.bounds, CGSizeMake(20, 20));
}


@end
