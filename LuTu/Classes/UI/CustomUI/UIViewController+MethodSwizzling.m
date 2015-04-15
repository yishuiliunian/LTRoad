//
//  UIViewController+MethodSwizzling.m
//  MiU
//
//  Created by thuai on 15/4/12.
//  Copyright (c) 2015年 MiU. All rights reserved.
//

#import "UIViewController+MethodSwizzling.h"
#import <DZImageCache.h>
#import <objc/runtime.h>


@implementation UIViewController (MethodSwizzling)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        {
            void(^SwizzingMethod)(SEL origin ,SEL aim) = ^(SEL origin ,SEL aim) {
                Method originMethod = class_getInstanceMethod([self class], origin);
                Method swizzledMethod = class_getInstanceMethod([self class], aim);
                method_exchangeImplementations(originMethod, swizzledMethod);
            };
            //
            SwizzingMethod(@selector(viewDidAppear:), @selector(swizzling_viewDidAppear:));
            SwizzingMethod(@selector(viewWillLayoutSubviews), @selector(swizzing_viewWillLayoutSubviews));
        }
    });
}

- (void)swizzling_viewDidAppear:(BOOL)animated
{
    [self swizzling_viewDidAppear:animated];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

- (void) swizzing_viewWillLayoutSubviews
{
    [self swizzing_viewWillLayoutSubviews];
    
}
@end
