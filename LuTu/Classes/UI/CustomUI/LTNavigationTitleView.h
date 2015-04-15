//
//  LTNavigationTitleView.h
//  LuTu
//
//  Created by stonedong on 15/4/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTNavigationTitleView : UIView
@property (nonatomic, copy) NSString *navigationBarTitle;
@property (nonatomic, copy) NSString *navigationBarSubtitle;
@property (nonatomic, copy) UIColor *navigationBarTitleFontColor;
UI_APPEARANCE_SELECTOR;
@property (nonatomic, copy) UIColor *navigationBarSubtitleFontColor;
UI_APPEARANCE_SELECTOR;
@end
