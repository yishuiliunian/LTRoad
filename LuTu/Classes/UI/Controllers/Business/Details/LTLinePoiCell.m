//
//  LTLinePoiCell.m
//  LuTu
//
//  Created by stonedong on 15/4/22.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTLinePoiCell.h"
#import <DZProgramDefines.h>
#import "LKHaneke.h"
#import "LTGlobals.h"
@implementation LTLinePoiCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
   INIT_SUBVIEW(self.contentView, UIView, _lineView); 
    INIT_SUBVIEW(self.contentView, UIView, _contentBackgroundView);

    INIT_SUBVIEW_UILabel(self.contentView, _contentTextLabel);
    INIT_SUBVIEW_UILabel(self.contentView, _timeLabel);
    INIT_SUBVIEW_UIImageView(self.contentView, _introImageView);
    INIT_SUBVIEW(self.contentView, LTLikeButton, _likeButton);
    INIT_SUBVIEW(self.contentView, LTPointView, _pointView);
    INIT_SUBVIEW_UIImageView(self.contentView, _timeIndicatorImageView);
    INIT_SUBVIEW_UILabel(self.contentView, _titleLabel);

    //
    _introImageView.hnk_cacheFormat = LTHanekeCacheFormatFeedBackground();
    _introImageView.layer.masksToBounds = YES;
    _introImageView.layer.cornerRadius = 5;
    _contentBackgroundView.backgroundColor = [UIColor whiteColor];
    _contentBackgroundView.layer.cornerRadius = 5;
    _contentBackgroundView.layer.masksToBounds = YES;
    self.backgroundColor = [UIColor clearColor];
    _lineView.backgroundColor = LTColorPointGray();
    _contentTextLabel.numberOfLines = 0;
    
    _contentTextLabel.font = LTFontPOIDetail();
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void) setPoiInfos:(LTUIPoi *)poiInfos
{
    if (_poiInfos != poiInfos) {
        _poiInfos = poiInfos;
        [_poiInfos loadContentForCell:self];
    }
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    [_poiInfos layoutContentViewForCell:self];
}

@end
