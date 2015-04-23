//
//  LTAuthViewController.m
//  LuTu
//
//  Created by stonedong on 15/4/23.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTAuthViewController.h"
#import <SAReqManager.h>
@interface LTAuthViewController ()

@end

@implementation LTAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleWeiboAction:(id)sender {
    
}
- (IBAction)handleQQAction:(id)sender {
    
}
- (IBAction)handleWeixinAction:(id)sender {
    [[SAReqManager shareManager] requestWeiXinAuth:^(SAToken *token, NSError *error) {
        
    }];
}

@end
