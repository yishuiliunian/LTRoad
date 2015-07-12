//
//  LTGlobalViewController.h
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTGuideContainerViewController.h"
@class LTGlobalViewController;
@interface UIViewController (GlobalNavigation)
@property (nonatomic, strong, readonly) LTGlobalViewController* globalViewController;
@end

@interface LTGlobalViewController : UIViewController
-  (void) loadAuthViewController:(LTAuthSucceedBlock)block;
@end
