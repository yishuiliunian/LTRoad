//
//  LTTopActionButton.h
//  LuTu
//
//  Created by stonedong on 15/6/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LTTopActionButton;
@protocol LTToggleActionProtocol <NSObject>

- (void) toggleActionButton:(LTTopActionButton*)sender;

@end

@interface LTTopActionButton : UIButton
@property (nonatomic, assign) BOOL isAction;
- (void) addToggleActionTarget:(id<LTToggleActionProtocol>)target;
@end
