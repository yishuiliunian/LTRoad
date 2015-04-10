//
//  LTRecommondLineCell.m
//  LuTu
//
//  Created by stonedong on 15/4/8.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTRecommondLineCell.h"
#import <DZProgramDefines.h>
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
    [self setNeedsLayout];
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    _backgroundImageView.frame = self.bounds;
    _badgesView.frame = self.bounds;
    
    NSLog(@"%@", self.contentView.subviews);
}
@end
