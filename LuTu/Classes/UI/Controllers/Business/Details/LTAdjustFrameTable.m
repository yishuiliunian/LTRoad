//
//  LTAdjustFrameTable.m
//  LuTu
//
//  Created by stonedong on 15/5/25.
//  Copyright (c) 2015年 Road.Inc. All rights reserved.
//

#import "LTAdjustFrameTable.h"
#import "AdjustFrame.h"
@implementation LTAdjustFrameTable

- (BOOL) hintAdjustSupreView
{
    return NO;
}

- (void) handleAdjustFrame
{
    UIView* header = self.tableHeaderView;
    header.frame = CGRectMake(0, 0, CGRectGetWidth(header.frame), header.adjustHeight);
    self.tableHeaderView = header;
}

@end
