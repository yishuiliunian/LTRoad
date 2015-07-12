//
//  LTPhoneAuthViewController.m
//  LuTu
//
//  Created by stonedong on 15/7/12.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTPhoneAuthViewController.h"
#import <DZGeometryTools.h>
#import "LTBackgroundImageView.h"
#import "LTGlobals.h"
@interface LTPhoneAuthViewController ()
DEFINE_PROPERTY_STRONG(LTBackgroundImageView*, backgroundView);
@end

@implementation LTPhoneAuthViewController

- (void) initSubViews
{
    INIT_SUBVIEW(self.view, LTBackgroundImageView, _backgroundView);
    [self.view insertSubview:_backgroundView atIndex:0];
    INIT_SUBVIEW(self.scrollView, UITextField, _phoneTextField);
    INIT_SUBVIEW(self.scrollView, UITextField, _passwordTextField);
    INIT_SUBVIEW_UIButton(self.scrollView, _sendButton);
    //
    _backgroundView.image = DZCachedImageByName(@"auth_bg");
    
    //
    _phoneTextField.isScrollInputView = YES;
    _passwordTextField.isScrollInputView = YES;
    _sendButton.isScrollInputView = YES;
    //
    _phoneTextField.backgroundColor = [UIColor whiteColor];
    _passwordTextField.backgroundColor = [UIColor whiteColor];
    
    _phoneTextField.placeholder = @"电话号码";
    _passwordTextField.placeholder = @"密码";
    
    //
    [_sendButton setBackgroundColor:LTColorButtonBlue()];
    [_sendButton setTitleColor:LTColorDetailGray() forState:UIControlStateHighlighted];
    [_sendButton setTitleColor:LTColorDetailGray() forState:UIControlStateSelected];


}

- (BOOL) checkInputVaild
{
    if (!_phoneTextField.text || [_phoneTextField.text isEqualToString:@""]) {
        MUAlertShowError(@"请输入电话号码");
        return NO;
    }
    
    if (!_passwordTextField.text || [_passwordTextField.text isEqualToString:@""]) {
        MUAlertShowError(@"请输入密码");
        return NO;
    }
    
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initSubViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void) viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _backgroundView.frame = self.view.bounds;
    CGRect phoneRect = self.view.bounds;
    phoneRect.size.height = 44;
    phoneRect = CGRectCenterSubSize(phoneRect, CGSizeMake(30, 0));
    
    CGRect passwordRect = CGRectCenterOffsetSize(phoneRect, phoneRect.size, 30, CGRectMaxYEdge);
    CGRect buttonRect = CGRectCenterOffsetSize(passwordRect, passwordRect.size, 60, CGRectMaxYEdge);
    
    _phoneTextField.frame = phoneRect;
    _passwordTextField.frame = passwordRect;
    _sendButton.frame = buttonRect;
    
    
    _phoneTextField.layer.cornerRadius = CGRectGetHeight(passwordRect)/2;
    _passwordTextField.layer.cornerRadius = CGRectGetHeight(passwordRect)/2;
    _sendButton.layer.cornerRadius = CGRectGetHeight(buttonRect)/2;
    
    void(^DecorateTextField)(UITextField* t) = ^(UITextField* t) {
        UIView* leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetHeight(passwordRect)/2, 0)];
        UIView* rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetHeight(passwordRect)/2, 0)];
        t.leftView = leftView;
        t.rightView = rightView;
        t.leftViewMode = UITextFieldViewModeAlways;
        t.rightViewMode = UITextFieldViewModeAlways;
    };
    
    DecorateTextField(_passwordTextField);
    DecorateTextField(_phoneTextField);
}
@end
