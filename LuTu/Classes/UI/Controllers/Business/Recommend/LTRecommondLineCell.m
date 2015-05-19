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
#import "LTGlobals.h"
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
    INIT_SUBVIEW(self.contentView, UILabel, _titleBabel);
    //
    _backgroundImageView.hnk_cacheFormat = LTHanekeCacheFormatFeedBackground();
    _backgroundImageView.layer.masksToBounds = YES;
    _backgroundImageView.layer.cornerRadius = 5;
    //
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //
    ColorLabelWithWhite(_dateLabel);
    ColorLabelWithWhite(_distanceLabel);
    ColorLabelWithWhite(_titleBabel);
    
    //
    _distanceIconImageView.image = DZCachedImageByName(@"location_list");
    //
    [self decerateLikeButtonWithBeFav:NO count:0];

}

- (void) decerateLikeButtonWithBeFav:(BOOL)isFav count:(int)count
{
    if (isFav) {
        [_likeButton setImage:DZCachedImageByName(@"icon_care") forState:UIControlStateNormal];
    } else {
        [_likeButton setImage:DZCachedImageByName(@"icon_care") forState:UIControlStateNormal];
    }
    [_likeButton setTitle:[@(count) stringValue] forState:UIControlStateNormal];
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
    _titleBabel.text = _line.title;
    _dateLabel.text = _line.createDateString;
    _distanceLabel.text = _line.distance;
    [_backgroundImageView loadFeedBackgroundURL:_line.backgroudImageURL];
    [self decerateLikeButtonWithBeFav:NO count:_line.likeCount];
    [self setNeedsLayout];
    
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    _backgroundImageView.frame = CGRectCenterSubSize(self.contentView.bounds, CGSizeMake(10, 10));
    
    CGSize distanceIconSize = CGSizeMake(30, 30);
    CGFloat xSpace = 10;
    CGFloat ySpace = 10;
    
    
    CGSize likeButtonSize = CGSizeMake(60, 20);
    CGFloat maxWidth = CGRectGetWidth(self.bounds) - xSpace*3 - likeButtonSize.width;
    _distanceIconImageView.frame = CGRectMake(xSpace, CGRectGetMaxY(_backgroundImageView.frame) - ySpace - distanceIconSize.height, distanceIconSize.width, distanceIconSize.height);
    CGRect distanceLabelFrame = CGRectOffset(_distanceIconImageView.frame, distanceIconSize.width + xSpace, 0);
    distanceLabelFrame.size.width =  _line.distanceUIWidth;
    _distanceLabel.frame = distanceLabelFrame;
    
    CGRect badgeFrame = CGRectOffset(_distanceLabel.frame, CGRectGetWidth(_distanceLabel.frame) + xSpace, 0);
    badgeFrame.size.width = maxWidth - CGRectGetMaxX(_distanceLabel.frame) - xSpace;
    _badgesView.frame = badgeFrame;
    //
    CGFloat titleHeight = 30;
    _titleBabel.frame = CGRectMake(xSpace, CGRectGetMinY(_distanceIconImageView.frame) - titleHeight, maxWidth, titleHeight);
    
    CGFloat dateHeight = 30;
    _dateLabel.frame = CGRectMake(xSpace, CGRectGetMinY(_titleBabel.frame) - dateHeight,  maxWidth, dateHeight);

    
    CGFloat lbStartX = CGRectGetMaxX(_titleBabel.frame) + xSpace;
    CGFloat lbStartY = CGRectGetMinY(_dateLabel.frame) + (CGRectGetMaxY(_distanceIconImageView.frame) - CGRectGetMinY(_dateLabel.frame) - likeButtonSize.height) / 2;
    _likeButton.frame = CGRectMake(lbStartX, lbStartY, likeButtonSize.width, likeButtonSize.height);
    
}
@end
