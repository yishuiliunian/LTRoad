//
//  LTGuideContainerViewController.h
//  LuTu
//
//  Created by stonedong on 15/4/23.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTNavigationController.h"

typedef void (^LTAuthSucceedBlock)();
@interface LTGuideContainerViewController : LTNavigationController
@property (nonatomic, strong) LTAuthSucceedBlock succeedBlock;
@end


@interface UIViewController (Auth)
- (void) ltAuthSuccess;
- (void) ltAddUserInfoSuccess
;
@end