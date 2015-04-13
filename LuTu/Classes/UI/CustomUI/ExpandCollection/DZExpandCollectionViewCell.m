//
//  DZExpandCollectionViewCell.m
//  LuTu
//
//  Created by stonedong on 15/4/13.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "DZExpandCollectionViewCell.h"

@implementation DZExpandCollectionViewCell

- (void) setExpanded:(BOOL)expanded
{
    _expanded = expanded;
    [self setNeedsLayout];
}
@end
