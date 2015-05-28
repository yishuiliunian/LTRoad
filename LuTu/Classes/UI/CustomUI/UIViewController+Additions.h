//
//  UIViewController+Additions.h
//  LuTu
//
//  Created by stonedong on 15/4/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Additions)
- (void) loadNavigationBarSearchItem;
- (void) loadBackNavigationItem;
- (UIBarButtonItem*) customBarButtonItemWithTarget:(id)target selector:(SEL)selector image:(NSString*)image highlightImage:(NSString*)hightlightName;
@end
