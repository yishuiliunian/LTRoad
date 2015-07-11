//
//  LTAppearenceTools.m
//  LuTu
//
//  Created by stonedong on 15/4/6.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTAppearenceTools.h"
#import "LTColors.h"
#import <DZImageCache.h>
#import <objc/runtime.h>
#import "LTNavigationBar.h"


void LTSetupNavigationBar()
{
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           UITextAttributeTextColor : [UIColor whiteColor]
                                                           }];
    
}

void LTAppearanceSetup()
{
    LTSetupNavigationBar();
}

CGFloat LTFeedContentWidth()
{
    static CGFloat width;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        width = CGRectGetWidth([UIScreen mainScreen].applicationFrame) - LTLayoutXOffset*2;
    });
    return width;
}

static CGFloat kEndPoint = 1.5;

void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor)
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    
    NSArray *colors = @[(__bridge id) startColor, (__bridge id) endColor];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    CGPoint startPoint = CGPointMake(rect.size.width/2, 0);
    CGPoint endPoint = CGPointMake(rect.size.width/2, rect.size.height/kEndPoint);
    
    CGContextSaveGState(context);
    CGContextAddRect(context, rect);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextSetStrokeColorWithColor(context, [[UIColor clearColor] CGColor]);
}

UIImage* imageWithColor(UIColor *color)
{
    CGRect rect = CGRectMake(0, 0, 1, 64);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

UIImage* imageWithGradients(NSArray *colours)
{
    CGRect rect = CGRectMake(0, 0, 1, 64);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor * beginColor = [colours objectAtIndex:0];
    UIColor * endColor = [colours objectAtIndex:1];
    drawLinearGradient(context, rect, beginColor.CGColor, endColor.CGColor);
    CGContextRestoreGState(context);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}



static void* kLTNavigationBarStyle = &kLTNavigationBarStyle;

@implementation UIViewController (Appearance)

- (void) setNaviationBarStyle:(LTNavigationStyle)naviationBarStyle
{
    objc_setAssociatedObject(self, kLTNavigationBarStyle, @(naviationBarStyle), OBJC_ASSOCIATION_RETAIN);
}

- (LTNavigationStyle) naviationBarStyle
{
    NSNumber* num = objc_getAssociatedObject(self, kLTNavigationBarStyle);
    if (!num) {
        return LTNavigationStyleBlack;
    }
    return [num intValue];
}
- (void) loadNavigationBarAppearance:(LTNavigationStyle)style
{
    LTNavigationBar* bar = (LTNavigationBar*)self.navigationController.navigationBar;
    if ([bar isKindOfClass:[LTNavigationBar class]]) {
        [bar setNavigationBarWithColor:[UIColor clearColor]];
        switch (style) {
            case LTNavigationStyleBlack:
            {
                bar.barBackgroundImage = DZCachedImageByName(@"top_nav_bg");
            }
                break;
                
            case LTNavigationStyleTransparency:
            {
                
                bar.barBackgroundImage = imageWithColor([UIColor clearColor]);
            }
                break;
            default:
                break;
        }
    }
}

@end