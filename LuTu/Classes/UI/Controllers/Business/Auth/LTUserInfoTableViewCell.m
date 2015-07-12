//
//  LTUserInfoTableViewCell.m
//  LuTu
//
//  Created by stonedong on 15/7/12.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTUserInfoTableViewCell.h"
#import <DZGeometryTools.h>
@implementation LTUserInfoTableViewCell
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return self;
    }
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    CGRect contentRect = CGRectCenterSubSize(self.contentView.bounds, CGSizeMake(30, 0));
    
    CGRect titleRect;
    CGRect inputRect;
    
    CGRectDivide(contentRect, &titleRect, &inputRect, 70, CGRectMinXEdge);
    inputRect = CGRectShrink(inputRect, 10, CGRectMinXEdge);
    
    self.textLabel.frame = titleRect;
    self.detailTextLabel.frame = inputRect;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
