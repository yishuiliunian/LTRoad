//
//  LTCarMenberTableViewCell.m
//  LuTu
//
//  Created by stonedong on 15/6/2.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTCarMenberTableViewCell.h"
#import <DZGeometryTools.h>
#import "LTGlobals.h"
@implementation LTCarMenberTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    INIT_SUBVIEW(self.contentView, LTHeadImageView, _avatarImageView);
    INIT_SUBVIEW_UILabel(self.contentView, _detaiLabel);
    INIT_SUBVIEW_UILabel(self.contentView, _nickNameLabel);
    //
    _avatarImageView.hnk_cacheFormat = LTHanekeCacheFormatAvatar();
    return self;
}

- (void) setClubMember:(LTUIClubMember *)clubMember
{
    if (_clubMember != clubMember) {
        _clubMember = clubMember;
        
        //
        [_avatarImageView loadAvatarURL:_clubMember.avatarURL];
        _detaiLabel.text = _clubMember.vihicleModel;
        _nickNameLabel.text = _clubMember.name;
    }
}
- (void)awakeFromNib {
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    
    CGRect contentRect = CGRectCenterSubSize(self.contentView.bounds, CGSizeMake(20, 20));
    
    CGRect avatarRect;
    CGRect rightRect;
    
    CGRectDivide(contentRect, &avatarRect, &rightRect, CGRectGetHeight(contentRect), CGRectMinXEdge);
    
    CGRect nickRect;
    CGRect detaiRect;
    
    rightRect = CGRectShrink(rightRect, 10, CGRectMinXEdge);
    CGRectDivide(rightRect, &nickRect, &detaiRect, CGRectGetHeight(contentRect)/2, CGRectMinYEdge);
    
    _avatarImageView.frame = avatarRect;
    _nickNameLabel.frame = nickRect;
    _detaiLabel.frame = detaiRect;
    
}

@end
