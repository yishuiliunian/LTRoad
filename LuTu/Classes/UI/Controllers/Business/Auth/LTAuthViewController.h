//
//  LTAuthViewController.h
//  LuTu
//
//  Created by stonedong on 15/4/23.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^LTAuthSucceedBlock)();
@interface LTAuthViewController : UIViewController
@property (nonatomic, weak) IBOutlet UIButton* weiboButton;
@property (nonatomic, weak) IBOutlet UIButton* qqButton;
@property (nonatomic, weak) IBOutlet UIButton* weixinButton;
@property (nonatomic, strong) LTAuthSucceedBlock succeedBlock;
- (IBAction)handleWeiboAction:(id)sender;
- (IBAction)handleQQAction:(id)sender;
- (IBAction)handleWeixinAction:(id)sender;
@end
