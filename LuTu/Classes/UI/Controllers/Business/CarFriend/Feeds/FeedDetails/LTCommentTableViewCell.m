//
//  LTCommentTableViewCell.m
//  LuTu
//
//  Created by stonedong on 15/5/16.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTCommentTableViewCell.h"

@implementation LTCommentTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    INIT_SUBVIEW(self.contentView, LTTopicHeadView, _headerView);
    INIT_SUBVIEW(self.contentView, UILabel, _contentTextLabel);
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (void) setComment:(LTUIComment *)comment
{
    if (_comment != comment) {
        _comment = comment;
        [self decorateCell];
    }
}

- (void) decorateCell
{
    [_headerView.avatarImageView loadAvatarURL:_comment.avatarURL];
    [_headerView.nickLabel setText:_comment.nickName];
    _headerView.timeLabel.text = _comment.postDate;
    _headerView.roleLabel.text = _comment.roleName;
    _contentTextLabel.text = _comment.contentText;
}
- (void) layoutSubviews
{
    [super layoutSubviews];
    _headerView.frame = _comment.topRect;
    _contentTextLabel.frame = _comment.bottomRect;
}
@end
