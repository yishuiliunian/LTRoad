//
//  LTAuthViewController.h
//  LuTu
//
//  Created by stonedong on 15/4/23.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTAuthViewController : UIViewController
@property (nonatomic, weak) IBOutlet UIButton* weiboButton;
@property (nonatomic, weak) IBOutlet UIButton* qqButton;
@property (nonatomic, weak) IBOutlet UIButton* weixinButton;

- (IBAction)handleWeiboAction:(id)sender;
- (IBAction)handleQQAction:(id)sender;
- (IBAction)handleWeixinAction:(id)sender;
@end
