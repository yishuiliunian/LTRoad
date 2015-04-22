//
//  LTLinePointView.h
//  LuTu
//
//  Created by stonedong on 15/4/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTLinePointView.h"
@interface LTPointView : UIView
@property (nonatomic, strong) UIColor * color;
@end
@interface LTLinePointView : UIView
@property (nonatomic, strong) LTPointView* pointView;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UIImageView* imageView;
@property (nonatomic, strong) UILabel* detailLabel;
@end
