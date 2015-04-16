//
//  UIButton+decorate.m
//  LuTu
//
//  Created by stonedong on 15/4/16.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "UIButton+decorate.h"
#import <DZImageCache.h>
@implementation UIButton (decorate)
- (void) decorateWithImage:(NSString*)name highLightImage:(NSString*)highLightName title:(NSString*)title
{
    [self setImage:DZCachedImageByName(name) forState:UIControlStateNormal];
    [self setImage:DZCachedImageByName(highLightName) forState:UIControlStateHighlighted];
    [self setTitle:title forState:UIControlStateNormal];
}
@end
