//
//  LTPhoneAuthViewController.h
//  LuTu
//
//  Created by stonedong on 15/7/12.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DZProgramDefines.h>
#import <MSInputScrollViewController.h>
@interface LTPhoneAuthViewController : MSInputScrollViewController
DEFINE_PROPERTY_STRONG(UITextField*, phoneTextField);
DEFINE_PROPERTY_STRONG(UITextField*, passwordTextField);
DEFINE_PROPERTY_STRONG_UIButton(sendButton);

- (BOOL) checkInputVaild;
@end

