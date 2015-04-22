//
//  LTShowContentView.h
//  LuTu
//
//  Created by stonedong on 15/4/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTTopShowTextView.h"
#import "LTTopShowImageView.h"
@interface LTShowContentView : UIView
@property (nonatomic, strong) LTTopShowTextView* timeView;
@property (nonatomic, strong) LTTopShowTextView* distanceView;
@property (nonatomic, strong) LTTopShowTextView* roadStatusView;
@property (nonatomic, strong) LTTopShowImageView* carStyleView;
@end
