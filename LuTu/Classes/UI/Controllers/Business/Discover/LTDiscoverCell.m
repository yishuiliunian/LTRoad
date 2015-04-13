//
//  LTDiscoverCell.m
//  LuTu
//
//  Created by stonedong on 15/4/13.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTDiscoverCell.h"
#import "LKHaneke.h"
@implementation LTDiscoverCell

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SUBVIEW_UIImageView(self.contentView, _backgroundImageView);
    _backgroundImageView.hnk_cacheFormat = LTHanekeCacheFormatDiscoverBackground();
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    self.backgroundImageView.frame = self.bounds;
}

- (void) setDiscoverItem:(LTUIDiscoverItem *)discoverItem
{
    if (_discoverItem != discoverItem) {
        _discoverItem = discoverItem;
        [self devoreateCell];
    }
}

- (void) devoreateCell
{
    [self.backgroundImageView hnk_setImageFromURL:_discoverItem.backgroundURL];
}
@end
