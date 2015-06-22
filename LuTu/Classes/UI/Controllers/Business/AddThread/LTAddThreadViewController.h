//
//  LTAddThreadViewController.h
//  LuTu
//
//  Created by stonedong on 15/6/3.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTUICarMeet.h"
@interface LTAddThreadViewController : UIViewController
@property (nonatomic, strong) NSArray* allCarClubs;
@property (nonatomic, strong) LTUICarMeet* selectedCarMeet;
@end
