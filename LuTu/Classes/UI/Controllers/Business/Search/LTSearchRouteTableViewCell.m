//
//  LTSearchRouteTableViewCell.m
//  LuTu
//
//  Created by stonedong on 15/6/7.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTSearchRouteTableViewCell.h"
#import "LTGlobals.h"

@implementation LTSearchRouteTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    INIT_SUBVIEW_UIImageView(self.contentView, _introImageView);
    INIT_SUBVIEW_UILabel(self.contentView, _titleLabel);
    INIT_SUBVIEW_UILabel(self.contentView, _timeLabel);
    //
    _introImageView.hnk_cacheFormat = LTHanekeCacheFormatAvatar();
    _introImageView.layer.masksToBounds = YES;
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void) setRouteInfo:(LTUIRouteSearchInfo *)routeInfo
{
    if (_routeInfo != routeInfo) {
        _routeInfo = routeInfo;
        [_introImageView loadLittleImageURL:_routeInfo.introImageURL];
        _titleLabel.text = routeInfo.title;
        _timeLabel.text = routeInfo.timeText;
    }
}
- (void) layoutSubviews
{
    [super layoutSubviews];
    CGRect contentRect = CGRectCenterSubSize(self.contentView.bounds, CGSizeMake(20, 20));
    CGRect imageRect;
    CGRect textRect;
    CGRectDivide(contentRect, &imageRect, &textRect, CGRectGetHeight(contentRect), CGRectMinXEdge);
    
    textRect = CGRectShrink(textRect, 10, CGRectMinXEdge);
    CGRect titleRect;
    CGRect timeRect;
    
    CGRectDivide(textRect, &titleRect, &timeRect, CGRectGetHeight(contentRect)/ 2, CGRectMinYEdge);
    _introImageView.frame = imageRect;
    _timeLabel.frame = timeRect;
    _titleLabel.frame = titleRect;
    
}
@end
