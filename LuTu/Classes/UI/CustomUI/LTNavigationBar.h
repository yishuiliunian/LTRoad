//
//  LTNavigationBar.h
//  LuTu
//
//  Created by stonedong on 15/4/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTNavigationBar : UINavigationBar
@property (nonatomic, strong) UIImage* barBackgroundImage;
@property (strong, nonatomic)  UIColor *color;

-(void)setNavigationBarWithColor:(UIColor *)color;
-(void)setNavigationBarWithColors:(NSArray *)colours;


@end
