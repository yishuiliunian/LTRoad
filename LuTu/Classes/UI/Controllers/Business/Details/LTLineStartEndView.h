//
//  LTLineStartEndView.h
//  LuTu
//
//  Created by stonedong on 15/4/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTLinePointView.h"

extern CGFloat const LTLinePointViewHeight;

@interface LTLineStartEndView : UIView
@property (nonatomic, strong) LTLinePointView* startPointView;
@property (nonatomic, strong) LTLinePointView* endPointView;
@end
