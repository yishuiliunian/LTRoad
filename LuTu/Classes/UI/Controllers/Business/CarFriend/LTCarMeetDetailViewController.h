//
//  LTCarMeetDetailViewController.h
//  LuTu
//
//  Created by stonedong on 15/4/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DZSwipeViewController.h>
#import "LTUICarMeet.h"
@interface LTCarMeetDetailViewController : UIViewController
@property (nonatomic, strong) LTUICarMeet* carClub;

- (instancetype) initWithCarClub:(LTUICarMeet*)carClub;
@end
