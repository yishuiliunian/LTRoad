//
//  UIViewController+Additions.m
//  LuTu
//
//  Created by stonedong on 15/4/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "UIViewController+Additions.h"
#import <DZImageCache.h>
@implementation UIViewController (Additions)
- (void) loadNavigationBarSearchItem
{
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc] initWithImage:DZCachedImageByName(@"search1") style:UIBarButtonItemStyleDone target:self action:@selector(search)];
    self.navigationItem.rightBarButtonItem = rightItem;
    //
}

- (void) search
{
    
}
@end
