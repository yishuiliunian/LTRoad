//
//  LTBadgeContentView.h
//  LuTu
//
//  Created by stonedong on 15/4/8.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LTBadgeItem.h"
@interface LTBadgeContentView : UIView
@property (nonatomic, assign) float itemSpace;
@property (nonatomic, strong) NSArray* badgeItems;
@end
