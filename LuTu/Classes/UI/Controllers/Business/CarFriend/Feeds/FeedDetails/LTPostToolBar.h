//
//  LTPostToolBar.h
//  LuTu
//
//  Created by stonedong on 15/5/16.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LTPostToolBar;
@protocol LTPostToolBarDelegate
- (void) postToolBar:(LTPostToolBar*)toolbar didMoveToIndex:(int)index;
@end

@interface LTPostToolBar : UIView
@property (nonatomic, weak) NSObject<LTPostToolBarDelegate>* delegate;
@property (nonatomic, assign) int pageCount;
@property (nonatomic, assign) int currentPageIndex;
@end
