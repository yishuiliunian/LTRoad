//
//  LTDiscoverCell.m
//  LuTu
//
//  Created by stonedong on 15/4/13.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTDiscoverCell.h"
#import "LKHaneke.h"
#import "LTColors.h"
@implementation LTDiscoverCell

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SUBVIEW_UIImageView(self.contentView, _backgroundImageView);
    INIT_SUBVIEW_UILabel(self.contentView, _titleLabel);
    _backgroundImageView.hnk_cacheFormat = LTHanekeCacheFormatDiscoverBackground();
    _backgroundImageView.layer.masksToBounds = YES;
    ColorLabelWithWhite(_titleLabel);
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    self.backgroundImageView.frame = self.bounds;
    CGFloat xOffSet = 10;
    _titleLabel.frame = CGRectMake(xOffSet, 10, CGRectGetWidth(self.bounds) - xOffSet*2, 25);
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
    _titleLabel.text = self.discoverItem.title;
}
@end
