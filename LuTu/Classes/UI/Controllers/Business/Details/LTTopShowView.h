//
//  LTTopShowView.h
//  LuTu
//
//  Created by stonedong on 15/4/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTTopShowView : UIView
{
    UIView* _topView;
}
@property (nonatomic, strong, readonly) UIView* topView;
@property (nonatomic, strong, readonly) UILabel* detailLabel;

@end
