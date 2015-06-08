//
//  LTMyNewsTableViewCell.m
//  LuTu
//
//  Created by stonedong on 15/6/8.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTMyNewsTableViewCell.h"

@implementation LTMyNewsTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    INIT_SUBVIEW_UILabel(self.contentView, _titleLabel);
    INIT_SUBVIEW_UILabel(self.contentView, _detailLabel);
    return self;
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
    CGRect titleRect;
    CGRect detailRect;
    
    CGRectDivide(contentRect, &titleRect, &detailRect, CGRectGetHeight(contentRect) / 2 , CGRectMaxYEdge);
    _titleLabel.frame = titleRect;
    _detailLabel.frame = detailRect;
}

@end
