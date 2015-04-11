//
//  LTBadgeContentView.m
//  LuTu
//
//  Created by stonedong on 15/4/8.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTBadgeContentView.h"
#import "LTBadgeView.h"
#import "LTBadgeView_Private.h"
#import <DZProgramDefines.h>
#import <DZGeometryTools.h>

@interface LTBadgeContentView ()

{
    NSMutableArray* _cacheBadgeViews;
}

@end
@implementation LTBadgeContentView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    _cacheBadgeViews = [NSMutableArray new];
    _itemSpace = 5;
    return self;
}

- (void) removeAllBadgeView
{
    NSArray* subViews = [self.subviews copy];
    for (UIView* v  in subViews) {
        if (![v isKindOfClass:[LTBadgeView class]]) {
            continue;
        }
        LTBadgeView* badgeView = (LTBadgeView*)v;
        [badgeView removeFromSuperview];
        [badgeView prepareReuse];
        [_cacheBadgeViews addObject:badgeView];
    }
}

- (void) setBadgeItems:(NSArray *)badgeItems
{
    if (_badgeItems != badgeItems) {
        _badgeItems = badgeItems;
        [self setNeedsLayout];
    }
}

- (LTBadgeView*) dequeBadgeView
{
    if (_cacheBadgeViews.count) {
        LTBadgeView* badgeView = _cacheBadgeViews.lastObject;
        [_cacheBadgeViews removeObject:badgeView];
        return badgeView;
    } else {
        return nil;
    }
}

- (LTBadgeView*) oneCanUserBadgeView {
    LTBadgeView* view = [self dequeBadgeView];
    if (view) {
        return view;
    }
    return [LTBadgeView new];
}
- (void) layoutSubviews
{
    [super layoutSubviews];
    [self removeAllBadgeView];
    CGFloat maxWidth = CGRectGetWidth(self.bounds);
    NSMutableArray* canShowItems = [NSMutableArray new];
    
    CGFloat sumTotal = _itemSpace;
    for (LTBadgeItem* item in _badgeItems) {
        CGFloat aim =  sumTotal + item.width + _itemSpace;
        
        if (aim > maxWidth) {
            break;
        }
        [canShowItems addObject:item];
        sumTotal = aim;
    }
    
    CGFloat startX = _itemSpace;
    for (LTBadgeItem* item  in canShowItems) {
        LTBadgeView* bView = [self oneCanUserBadgeView];
        [self addSubview:bView];
        bView.frame = CGRectMake(startX, CGRectHeightOffsetCenter(self.bounds, item.height), item.width, item.height);
        bView.item = item;
        //
        startX = CGRectGetMaxX(bView.frame) + _itemSpace;
    }
}
@end
