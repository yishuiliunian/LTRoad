//
//  LTCarMeetFeedCell.m
//  LuTu
//
//  Created by stonedong on 15/4/15.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTCarMeetFeedCell.h"
#import "LKHaneke.h"
@implementation LTCarMeetFeedCell
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    
    INIT_SUBVIEW_UIImageView(self.contentView, _feedImageView);
    INIT_SUBVIEW_UILabel(self.contentView, _carMeetTitleLabel);
    INIT_SUBVIEW_UILabel(self.contentView, _feedDetailLabel);
    INIT_SUBVIEW_UILabel(self.contentView, _ownerNameLabel);
    INIT_SUBVIEW(self.contentView, LTLikeButton, _commentButton);
    //
    _feedImageView.hnk_cacheFormat = LTHanekeCacheFormatCarMeet();
    _feedImageView.layer.masksToBounds = YES;
    _feedDetailLabel.numberOfLines = 0;
    return self;
}

- (void) setCarMeetFeed:(LTUICarMeetFeed *)carMeetFeed
{
    if (carMeetFeed != _carMeetFeed) {
        _carMeetFeed = carMeetFeed;
        [self decorateCell];
    }
}

- (void) decorateCell
{
    [_feedImageView hnk_setImageFromURL:_carMeetFeed.feedImageURL];
    _carMeetTitleLabel.text = _carMeetFeed.carTitle;
    _feedDetailLabel.text = _carMeetFeed.detail;
    _ownerNameLabel.text = _carMeetFeed.ownerName;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    static CGFloat xSpace = 10;
    static CGFloat ySpace = 10;
    
    CGFloat contentWidth = CGRectGetWidth(self.contentView.bounds) - xSpace - xSpace;
    CGFloat contentHeight = CGRectGetHeight(self.contentView.bounds) - ySpace - ySpace;
    CGSize imageSize = CGSizeMake(100, contentHeight);
    
    CGFloat carMeetTitleHeight = 20;
    CGFloat labelWidth = contentWidth - imageSize.width - xSpace;
    _feedImageView.frame = CGRectMake(xSpace, ySpace, imageSize.width, imageSize.height);
    _carMeetTitleLabel.frame = CGRectMake(CGRectGetMaxX(_feedImageView.frame) + xSpace, ySpace, labelWidth, carMeetTitleHeight);
    _ownerNameLabel.frame = CGRectMake(CGRectGetMinX(_carMeetTitleLabel.frame), CGRectGetHeight(self.contentView.bounds) - ySpace - carMeetTitleHeight, labelWidth, carMeetTitleHeight);
    _feedDetailLabel.frame = CGRectMake(CGRectGetMinX(_carMeetTitleLabel.frame), CGRectGetMaxY(_carMeetTitleLabel.frame) + 5, labelWidth, CGRectGetMinY(_ownerNameLabel.frame) - CGRectGetMaxY(_carMeetTitleLabel.frame) - 10);

}
@end
