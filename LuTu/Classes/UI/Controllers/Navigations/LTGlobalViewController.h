//
//  LTGlobalViewController.h
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTAccountManager.h"
@class LTGlobalViewController;
@interface UIViewController (GlobalNavigation)
@property (nonatomic, strong, readonly) LTGlobalViewController* globalViewController;
@end

@interface LTGlobalViewController : UIViewController
- (void) viewController:(UIViewController*)viewController didEnterAccount:(LTAccount*)account;
@end
