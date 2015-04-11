//
//  LTRecommondLineCell.m
//  LuTu
//
//  Created by stonedong on 15/4/8.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTRecommondLineCell.h"
#import <DZProgramDefines.h>
#import <DZGeometryTools.h>
#import "LKHaneke.h"
@implementation LTRecommondLineCell
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    [self commonInit];
    return self;
}

- (void) commonInit
{
    INIT_SUBVIEW(self.contentView, UIImageView, _backgroundImageView);
    INIT_SUBVIEW(self.contentView, UILabel, _dateLabel);
    INIT_SUBVIEW(self.contentView, UILabel, _distanceLabel);
    INIT_SUBVIEW(self.contentView, LTLikeButton, _likeButton);
    INIT_SUBVIEW(self.contentView, LTBadgeContentView, _badgesView);
    INIT_SUBVIEW(self.contentView, UIImageView, _distanceIconImageView);
    //
    _backgroundImageView.hnk_cacheFormat = LTHanekeCacheFormatFeedBackground();
    _backgroundImageView.layer.masksToBounds = YES;
    _backgroundImageView.layer.cornerRadius = 5;
}

- (void) setLine:(LTRecommendLine *)line
{
    if (_line != line) {
        _line = line;
        [self decoreateContent];
    }
}

- (void) decoreateContent
{
    _badgesView.badgeItems = _line.tagBadgeItems;
    [_backgroundImageView hnk_setImageFromURL:_line.backgroudImageURL];
    [self setNeedsLayout];
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    _backgroundImageView.frame = CGRectCenterSubSize(self.contentView.bounds, CGSizeMake(10, 10));
    
    CGSize distanceIconSize = CGSizeMake(30, 30);
    CGFloat xSpace = 10;
    CGFloat ySpace = 10;
    CGFloat maxWidth = CGRectGetWidth(self.bounds) - xSpace*2;
    _distanceIconImageView.frame = CGRectMake(xSpace, CGRectGetMaxY(_backgroundImageView.frame) - ySpace - distanceIconSize.height, distanceIconSize.width, distanceIconSize.height);
    CGRect distanceLabelFrame = CGRectOffset(_distanceIconImageView.frame, distanceIconSize.width + xSpace, 0);
    distanceLabelFrame.size.width =  _line.distanceUIWidth;
    _distanceLabel.frame = distanceLabelFrame;
    
    CGRect badgeFrame = CGRectOffset(_distanceLabel.frame, CGRectGetWidth(_distanceLabel.frame) + xSpace, 0);
    badgeFrame.size.width = maxWidth - CGRectGetMaxX(_distanceLabel.frame) - xSpace;
    _badgesView.frame = badgeFrame;
    
}
@end
