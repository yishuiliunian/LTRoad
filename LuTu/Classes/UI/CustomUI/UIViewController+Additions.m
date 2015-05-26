//
//  UIViewController+Additions.m
//  LuTu
//
//  Created by stonedong on 15/4/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "UIViewController+Additions.h"
#import <DZImageCache.h>
#import "LTNavigationController.h"
#import "LTSearchTableViewController.h"
@implementation UIViewController (Additions)
- (void) loadNavigationBarSearchItem
{
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc] initWithImage:DZCachedImageByName(@"search") style:UIBarButtonItemStyleDone target:self action:@selector(search)];
    self.navigationItem.rightBarButtonItem = rightItem;
    //
}

- (void) search
{
    LTSearchTableViewController* searchVC = [LTSearchTableViewController new];
    LTNavigationController* navVC = [[LTNavigationController alloc] initWithRootViewController:searchVC];
    [self.navigationController presentViewController:navVC animated:YES completion:nil];
}

- (UIBarButtonItem*) customBarButtonItemWithTarget:(id)target selector:(SEL)selector image:(NSString*)image highlightImage:(NSString*)hightlightName
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    UIImage* normalImage = DZCachedImageByName(image);
    [btn setImage:normalImage forState:UIControlStateNormal];
    [btn setImage:DZCachedImageByName(hightlightName) forState:UIControlStateHighlighted];
    CGSize size = normalImage.size;
    btn.frame = CGRectMake(0, 0, size.width, size.height + 10);
    UIBarButtonItem* item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}

- (UIBarButtonItem*) backBarButtonItem
{
    UIBarButtonItem* item = [self customBarButtonItemWithTarget:self selector:@selector(__dismissViewController) image:@"top_arrowback_black" highlightImage:nil];
    return item;
}

- (void) loadBackNavigationItem
{
    self.navigationItem.leftBarButtonItem = [self backBarButtonItem];
}
- (void) __dismissViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
