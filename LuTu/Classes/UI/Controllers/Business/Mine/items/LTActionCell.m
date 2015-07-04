//
//  LTActionCell.m
//  LuTu
//
//  Created by stonedong on 15/4/16.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTActionCell.h"
#import <DZGeometryTools.h>
@interface LTActionCell()
{
    UIImageView* _backgroundImageView;
}
@end
@implementation LTActionCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:reuseIdentifier];
    
    if (!self) {
        return self;
    }
    _backgroundImageView = [UIImageView new];
    [self.contentView addSubview:_backgroundImageView];
    _backgroundImageView.backgroundColor = [UIColor blackColor];
    _backgroundImageView.alpha = 0.4;
    
    self.backgroundColor = [UIColor clearColor];
    self.textLabel.textColor = [UIColor whiteColor];
    return self;
}

- (void) layoutSubviews
{
    [super layoutSubviews];
    _backgroundImageView.frame = CGRectCenterSubSize(self.bounds, CGSizeMake(20, 10));
}
@end
