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



void LTSetupNavigationBar()
{
    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBackIndicatorImage:DZCachedImageByName(@"top_arrowback_black")];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:DZCachedImageByName(@"top_arrowback_black")];
}

void LTAppearanceSetup()
{
    LTSetupNavigationBar();
}