//
//  LTCarMeetCell.m
//  LuTu
//
//  Created by stonedong on 15/4/13.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTCarMeetCell.h"
#import "LKHaneke.h"
@interface LTCarMeetCell ()
{
    CGRect _unexpandedFrame;
}
@end
@implementation LTCarMeetCell

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return self;
    }
    INIT_SUBVIEW_UIImageView(self.contentView, _emblemImageView);
    INIT_SUBVIEW_UILabel(self.contentView, _titleLabel);
    _emblemImageView.hnk_cacheFormat = LTHanekeCacheFormatCarMeet();
    _emblemImageView.layer.masksToBounds = YES;
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
#if DEBUG
    self.contentView.backgroundColor = [UIColor redColor];
    INIT_SELF_SUBVIEW(LTCarMeetMenuView, _menuView);
    _menuView.backgroundColor = [UIColor greenColor];
#endif
    [_menuView.interButton addTarget:self action:@selector(didTapMenu:) forControlEvents:UIControlEventTouchUpInside];
    return self;
}

- (void) didTapMenu:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(carMeetCell:didTapOnMenuItem:)]) {
        [self.delegate carMeetCell:self didTapOnMenuItem:sender];
    }
}
- (void) setCarMeet:(LTUICarMeet *)carMeet
{
    if (_carMeet != carMeet) {
        _carMeet = carMeet;
        [self decorateCell];
    }
}

- (void) decorateCell
{
    [_emblemImageView hnk_setImageFromURL:_carMeet.emblemURL];
    _titleLabel.text = _carMeet.title;
    _menuView.detailTextLabel.text = _carMeet.detail;
}
- (void) layoutSubviews
{
    [super layoutSubviews];
    if (!self.expanded) {
        _unexpandedFrame = self.contentView.bounds;
    }
    self.contentView.frame = _unexpandedFrame;
    CGFloat width = CGRectGetWidth(self.contentView.bounds);
    _emblemImageView.frame = CGRectMake(0, 0, width, width);
    _titleLabel.frame = CGRectMake(0, CGRectGetMaxY(_emblemImageView.frame), width, CGRectGetHeight(self.contentView.frame) - width);
    
    _menuView.hidden = !self.expanded;
    if (self.expanded) {
        CGRect rect = CGRectZero;
        rect.origin.x = CGRectGetMaxX(_unexpandedFrame) + 10;
        rect.origin.y = 0;
        rect.size.width = CGRectGetWidth(self.bounds) - rect.origin.x - 10;
        rect.size.height = width;
        _menuView.frame = rect;
    } else {
        _menuView.frame = CGRectZero;
    }
}
@end
