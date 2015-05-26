//
//  LTNavigationBar.m
//  LuTu
//
//  Created by stonedong on 15/4/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTNavigationBar.h"
#import <DZImageCache.h>
#import <DZProgramDefines.h>
#import "LTAppearenceTools.h"

@interface LTNavigationBar ()
@property (nonatomic, strong) UIImageView* backgroundImageView;
@end
@implementation LTNavigationBar

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    _backgroundImageView = [UIImageView new];
    [self insertSubview:_backgroundImageView atIndex:0];
    return self;
}
- (void) layoutSubviews
{
    [super layoutSubviews];
    self.layer.masksToBounds = NO;
    _backgroundImageView.frame = CGRectMake(0, -20, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + 20);
}

- (void) setBarBackgroundImage:(UIImage *)barBackgroundImage
{
    _backgroundImageView.image = barBackgroundImage;
}


- (UIImage*) barBackgroundImage
{
    return _backgroundImageView.image;
}
-(void)awakeFromNib
{
    [super awakeFromNib];
    if (self.color) {
        [self setNavigationBarWithColor:self.color];
    } else {
        [self setNavigationBarWithColor:[UIColor whiteColor]];
    }
}





-(void)setNavigationBarWithColor:(UIColor *)color
{
    UIImage *image = imageWithColor(color);
    
    [self setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [self setBarStyle:UIBarStyleDefault];
    [self setShadowImage:[UIImage new]];
    [self setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [self setTintColor:[UIColor whiteColor]];
    [self setTranslucent:YES];
    
}

-(void)setNavigationBarWithColors:(NSArray *)colours
{
    UIImage *image = imageWithGradients(colours);
    
    [self setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [self setBarStyle:UIBarStyleDefault];
    [self setShadowImage:[UIImage new]];
    [self setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [self setTintColor:[UIColor whiteColor]];
    [self setTranslucent:YES];
}

@end
