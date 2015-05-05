//
//  LTMyClubTableViewCell.m
//  LuTu
//
//  Created by stonedong on 15/4/29.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTMyClubTableViewCell.h"
#import <DZGeometryTools.h>
#import "LKHaneke.h"
#import "LTColors.h"
@implementation LTMyClubTableViewCell


- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    INIT_SUBVIEW_UIImageView(self.contentView, _avatarImageView);
    INIT_SUBVIEW_UILabel(self.contentView, _titleLabel);
    INIT_SUBVIEW_UILabel(self.contentView, _detailLabel);
    INIT_SUBVIEW_UIButton(self.contentView,_exitButton);
    //
    [_exitButton setTitle:@"退出" forState:UIControlStateNormal];
    _detailLabel.textColor = LTColorDetailGray();
    _avatarImageView.hnk_cacheFormat = LTHanekeCacheFormatAvatar();
    [_exitButton setTitleColor:LTColorDetailGray() forState:UIControlStateNormal];
    
    return self;
}
- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    CGFloat yOffset = 16;
    CGFloat xOffset = 10;
    
    CGFloat imageWidth = CGRectGetHeight(self.bounds) - yOffset*2;
    _avatarImageView.frame = CGRectMake(xOffset, yOffset, imageWidth, imageWidth);
    
    CGSize exitButtonFrame = CGSizeMake(80, 30);
    CGFloat space = 10;
    CGFloat labelWidth = CGRectGetWidth(self.bounds) - CGRectGetMaxX(_avatarImageView.frame) - space*2 - xOffset - exitButtonFrame.width;
    CGFloat labelHeight = imageWidth/2;
    _titleLabel.frame = CGRectMake(CGRectGetMaxX(_avatarImageView.frame) + space, CGRectGetMinX(_avatarImageView.frame), labelWidth, labelHeight);
    _detailLabel.frame = CGRectOffset(_titleLabel.frame, 0, labelHeight);
    _exitButton.frame = CGRectMake(CGRectGetMaxX(_detailLabel.frame) + space, CGRectHeightOffsetCenter(self.bounds, exitButtonFrame.height), exitButtonFrame.width, exitButtonFrame.height);
}

- (void) setCarClubInfo:(LTUIMyCarClubInfo *)carClubInfo
{
    if (_carClubInfo != carClubInfo) {
        _carClubInfo = carClubInfo;
        [self decoreateCell];
    }
}


- (void) decoreateCell
{
    [_avatarImageView hnk_setImageFromURL:_carClubInfo.avatarImageUrl];
    _titleLabel.text = _carClubInfo.name;
    _detailLabel.text = _carClubInfo.detailInfo;
}

+ (CGFloat) layoutCellHeight
{
    return 80;
}
@end
